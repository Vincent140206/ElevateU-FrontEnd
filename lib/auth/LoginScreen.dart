
import 'package:elevateu_bcc_new/Premium.dart';
import 'package:flutter/material.dart';

import '../../NavBar/homeScreen/HomeScreen.dart';
import '../../Register/RegisterFormMentor.dart';
import '../../widgets/TextField.dart';
import 'OnBoardingScreen.dart';
import 'Recovery/RecoveryEmail.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            MaterialPageRoute(builder: (context) => const Onboarding()));
                      },
                      icon: const ImageIcon(
                        AssetImage('assets/icons/Chevron_Left.png'),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 125,),
                    const Text('Sign in',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        )
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
                          const Text("Let's Start your move",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Welcome back to ElevateU',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 34,),
                          const Text('Username',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(height: 11,),
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
                          const SizedBox(height: 32,),
                          const Text('Password',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(height: 11,),
                          SizedBox(
                              width: 356,
                              height: 48,
                              child: TextFields(
                                controller: passwordController,
                                hintText: 'Password',
                                obscureText: true,
                                color: const Color(0XFFEEEEEE),
                                borderColor: Colors.transparent,
                              )
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const RecoveryEmail()));
                              },
                              child: const Text('Lupa kata sandi?',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                          ),
                          const SizedBox(height: 273,),
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
                                          borderRadius: BorderRadius.circular(12)
                                      )
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => const PremiumScreen()));
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
                              TextButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupFormMentor(),
                                  ),
                                );
                              }, child: const Text('Sign Up')
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ]
          ),
        )
    );
  }
}