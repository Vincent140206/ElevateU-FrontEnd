import 'package:elevateu_bcc/screens/auth/recovery/RecoveryPassword.dart';
import 'package:elevateu_bcc/widgets/ElevatedButton.dart';
import 'package:elevateu_bcc/widgets/TextField.dart';
import 'package:flutter/material.dart';

class RecoveryEmail extends StatefulWidget {
  const RecoveryEmail({super.key});

  @override
  State<RecoveryEmail> createState() => RecoveryEmailState();
}

class RecoveryEmailState extends State<RecoveryEmail> {
  final TextEditingController emailController = TextEditingController();

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
                    "Pemulihan Password",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    'Kami akan mengirim kode pemulihan\npassword pada email ini',
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
                  const SizedBox(height: 10),
                  TextFields(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    color: Colors.white,
                    borderColor: const Color(0XFFFBBC05),
                  ),
                  const SizedBox(height: 18),
                  Image.asset('assets/images/Recovery.png'),
                  const SizedBox(height: 126),
                  Elevatedbutton1(
                    width: 356,
                    height: 48,
                    tulisan: 'Verifikasi Kode',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const RecoveryPassword()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}