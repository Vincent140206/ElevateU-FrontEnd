import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/services/auth_services.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../widgets/ElevatedButton.dart';
import '../../../../widgets/TextField.dart';
import 'RecoveryPassword.dart';

class RecoveryEmail extends StatefulWidget {
  const RecoveryEmail({super.key});

  @override
  State<RecoveryEmail> createState() => RecoveryEmailState();
}

class RecoveryEmailState extends State<RecoveryEmail> {
  final TextEditingController emailController = TextEditingController();
  final Dio dio = Dio();

  void saveEmail() async {
    final localStorageService = LocalStorageService();
    await localStorageService.saveEmail(emailController.text);
  }

  void validateAndProceed() async {
    if(emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email tidak boleh kosong')),
      );
      debugPrint('Validation failed: Address is empty');
      return;
    }
    saveEmail();
    String email = '';
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    debugPrint('Loaded email: $email');

    try {
      await resetPasswordOtp (email);
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