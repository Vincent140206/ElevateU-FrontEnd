import 'package:flutter/material.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../../widgets/TextField.dart';
import '../LoginScreen.dart';
import 'RegisterFormMentor.dart';
import 'RegisterFormStudent.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  String? selectedRole;
  bool isChecked = false;
  bool _obscureTextPassword = true;
  bool _obscureTextRePassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleRePasswordVisibility() {
    setState(() {
      _obscureTextRePassword = !_obscureTextRePassword;
    });
  }

  Future<void> saveUserData() async {
    final localStorageService = LocalStorageService();
    await localStorageService.saveUserData(
      nameController.text,
      emailController.text,
      passwordController.text,
      selectedRole ?? 'student',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 62),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/Chevron_Left.png'),
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 60),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let's Start your move",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Welcome back to ElevateU',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 34),
                    const Text('Nama'),
                    TextFields(
                      controller: nameController,
                      hintText: 'Jacob Hensen',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 15),
                    const Text('Email', style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 11),
                    TextFields(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 15),
                    const Text('Pilih Role', style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 11),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0XFFEEEEEE),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedRole != null ? selectedRole! : 'Pilih Role-mu',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: PopupMenuButton<String>(
                                    onSelected: selectRole,
                                    itemBuilder: (context) {
                                      return const [
                                        PopupMenuItem(value: 'Mentor', child: Text('Mentor')),
                                        PopupMenuItem(value: 'Student', child: Text('Student')),
                                      ];
                                    },
                                    icon: const Icon(Icons.arrow_drop_down),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Password'),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFFEEEEEE),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureTextPassword,
                        decoration: InputDecoration(
                          hintText: '8+ Characters, 1 Capital letter',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('Ulangi Password'),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFFEEEEEE),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: rePasswordController,
                        obscureText: _obscureTextRePassword,
                        decoration: InputDecoration(
                          hintText: '8+ Characters, 1 Capital letter',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextRePassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: _toggleRePasswordVisibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: toggleCheckbox,
                          child: Image.asset(
                            isChecked ? 'assets/icons/Ceklis.png' : 'assets/icons/Tidak Ceklis.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'By creating this account, you agree to \nour Terms of Service',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isChecked ? () async {
                        if (nameController.text.isEmpty) {
                          debugPrint('Validation failed: Name is empty');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Nama tidak boleh kosong')),
                          );
                          return;
                        }
                        if (emailController.text.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
                          debugPrint('Validation failed: Invalid email');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Email tidak valid')),
                          );
                          return;
                        }
                        if (passwordController.text.length < 8) {
                          debugPrint('Validation failed: Password too short');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Password harus minimal 8 karakter')),
                          );
                          return;
                        }
                        if (passwordController.text != rePasswordController.text) {
                          debugPrint('Validation failed: Passwords do not match');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Password tidak cocok')),
                          );
                          return;
                        }
                        await saveUserData();
                        debugPrint('Navigating to the next screen with role: $selectedRole');
                        if (selectedRole == 'Student') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const SignupFormStudent()),
                          );
                        } else if (selectedRole == 'Mentor') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupFormMentor(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                        } else {
                          debugPrint('Validation failed: No role selected');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Silakan pilih role')),
                          );
                        }
                      } : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0XFF00678D),
                        minimumSize: const Size(356, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Lanjutkan',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sudah punya akun?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}