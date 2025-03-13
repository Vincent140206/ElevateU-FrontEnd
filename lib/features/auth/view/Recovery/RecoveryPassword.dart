import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/auth_services.dart';
import '../../../../widgets/ElevatedButton.dart';
import '../../../../widgets/TextField.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final localStorageService = LocalStorageService();
  AuthServices authServices = AuthServices();
  bool _obscureTextPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void validateAndProceed() async {
    if(emailController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email tidak boleh kosong')),
      );
      debugPrint('Validation failed: email is empty');
      return;
    }
    if(passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password tidak boleh kosong')),
      );
      debugPrint('Validation failed: Password is empty');
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text);
      await prefs.setString('new_password', passwordController.text);
      await authServices.resetPassword(context, emailController.text, passwordController.text);

    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      final otp = await prefs.getString('otp');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')));
      debugPrint(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 62),
            Row(
              children: [
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/icons/Chevron_Left.png'),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 125),
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 29),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Masukkan password baru",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    'Buat kata sandi yang kuat dan aman untuk \nmelindungi akunmu',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 29),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 11),
                  TextFields(
                    enabled: true,
                    controller: emailController,
                    hintText: 'Masukan email di sini',
                    obscureText: false,
                    color: const Color(0XFFEEEEEE),
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 21),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 11),
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
                  SizedBox(height: 30,),
                  Elevatedbutton1(
                    width: 356,
                    height: 48,
                    tulisan: 'Verifikasi Kode',
                    onPressed: () {
                      validateAndProceed();
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}