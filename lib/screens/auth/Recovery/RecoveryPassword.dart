import 'package:elevateu_bcc/screens/auth/LoginScreen.dart';
import 'package:elevateu_bcc/widgets/ElevatedButton.dart';
import 'package:elevateu_bcc/widgets/PopUp.dart';
import 'package:flutter/material.dart';

import '../../../widgets/TextField.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

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
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 11),
                  TextFields(
                    controller: passwordController,
                    hintText: '8+ Characters, 1 Capital letter',
                    obscureText: true,
                    color: const Color(0XFFEEEEEE),
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 21),
                  const Text(
                    'Ulangi Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 11),
                  TextFields(
                    controller: rePasswordController,
                    hintText: '8+ Characters, 1 Capital letter',
                    obscureText: true,
                    color: const Color(0XFFEEEEEE),
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 20),
                  Elevatedbutton1(
                    width: 356,
                    height: 48,
                    tulisan: 'Verifikasi Kode',
                    onPressed: () {
                      PopUp.show(
                        context,
                        imagePath: 'assets/images/AkunCreated.png',
                        deskripsi: 'Anda berhasil mengganti \npassword',
                      ).then((_) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      });
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