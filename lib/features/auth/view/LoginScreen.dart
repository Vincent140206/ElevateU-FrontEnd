import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/PopUp.dart';
import '../../../widgets/TextField.dart';
import '../../Premium/Premium.dart';
import '../bloc/LoginBloc.dart';
import '../bloc/LoginEvent.dart';
import 'OnBoardingScreen.dart';
import 'Recovery/RecoveryEmail.dart';
import 'Register/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool _obscureTextPassword = true;

  void validateAndProceed() async {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username tidak boleh kosong!')),
      );
      debugPrint('Validation failed: Username is empty');
      return;
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password tidak boleh kosong!')),
      );
      debugPrint('Validation failed: Password is empty');
      return;
    }

    context.read<LoginBloc>().add(LoginSubmitted(
      email: usernameController.text,
      password: passwordController.text,
    ));
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          PopUp.show(
            context,
            imagePath: 'assets/images/AkunCreated.png',
            deskripsi: 'Login Berhasil!',
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const PremiumScreen()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 62),
              Row(
                children: [
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Onboarding()),
                      );
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
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
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
                        const Text(
                          'Welcome back to ElevateU',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 34),
                        const Text(
                          'Username',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 11),
                        SizedBox(
                          width: 356,
                          height: 48,
                          child: TextFields(
                            controller: usernameController,
                            hintText: 'Email',
                            fillColor: const Color(0XFFEEEEEE),
                            obscureText: false,
                            color: const Color(0XFFEEEEEE),
                            borderColor: Colors.transparent,
                          ),
                        ),
                        const SizedBox(height: 32),
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
                        TextButton(
                          onPressed: () {
                            Navigator.of(context ).push(
                              MaterialPageRoute(builder: (context) => const RecoveryEmail()),
                            );
                          },
                          child: const Text(
                            'Lupa kata sandi?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 273),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 356,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0XFF0D7CA4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  validateAndProceed();
                                },
                                child: const Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Belum punya akun?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signupscreen(),
                                  ),
                                );
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}