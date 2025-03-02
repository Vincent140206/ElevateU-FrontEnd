import 'package:elevateu_bcc/screens/auth/LoginScreen.dart';
import 'package:elevateu_bcc/widgets/ElevatedButton.dart';
import 'package:elevateu_bcc/widgets/TextField.dart';
import 'package:flutter/material.dart';

import '../../widgets/PopUp.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  String? selectedRole;
  bool isChecked = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 62),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
              const SizedBox(width: 65),
              const Spacer(),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Data Diri",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Buat kata sandi yang kuat dan aman untuk \nmelindungi akunmu',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 34),
                    const Text(
                      'Pilih Role',
                      style: TextStyle(fontSize: 14),
                    ),
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
                                    selectedRole != null ? '$selectedRole' : 'Pilih Role-mu',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  width: 81,
                                  child: DropdownButton<String>(
                                    isExpanded: false,
                                    value: null,
                                    items: <String>['Mentor', 'Student'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedRole = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Nama'),
                    const SizedBox(height: 12),
                    TextFields(
                      controller: nameController,
                      hintText: 'Jacob Hensen',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Password'),
                    const SizedBox(height: 12),
                    TextFields(
                      controller: passwordController,
                      hintText: '8+ Characters, 1 Capital letter',
                      obscureText: true,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Ulangi Password'),
                    const SizedBox(height: 12),
                    TextFields(
                      controller: rePasswordController,
                      hintText: '8+ Characters, 1 Capital letter',
                      obscureText: true,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Masukan Otp'),
                    const SizedBox(height: 12),
                    TextFields(
                      controller: otpController,
                      hintText: '6 Numbers',
                      obscureText: true,
                      color: const Color(0XFFEEEEEE ),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 105),
                    Elevatedbutton1(
                      width: 356,
                      height: 48,
                      tulisan: 'Lanjutkan',
                      onPressed: () {
                        PopUp.show(
                          context,
                          imagePath: 'assets/images/AkunCreated.png',
                          deskripsi: 'Anda berhasil\nmembuat Akun',
                        ).then((_) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}