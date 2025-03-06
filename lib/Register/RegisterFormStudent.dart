import 'package:flutter/material.dart';
import '../auth/LoginScreen.dart';
import '../widgets/ElevatedButton.dart';
import '../widgets/PopUp.dart';
import '../widgets/TextField.dart';

class SignupFormStudent extends StatefulWidget {
  const SignupFormStudent({super.key});

  @override
  State<SignupFormStudent> createState() => SignupFormState();
}

class SignupFormState extends State<SignupFormStudent> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

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
                      'No Hp',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 11),
                    TextFields(
                        controller: numberController,
                        hintText: '0812-5678-9010',
                        obscureText: false,
                        color: const Color(0XFFEEEEEE),
                        borderColor: Color(0XFFFBBC05)
                    ),
                    const SizedBox(width: 20),
                  const SizedBox(height: 12),
                  const Text('Alamat'),
                  const SizedBox(height: 12),
                  TextFields(
                    controller: addressController,
                    hintText: 'Masukan alamat',
                    obscureText: false,
                    color: const Color(0XFFEEEEEE),
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 12),
                  const Text('Universitas'),
                  const SizedBox(height: 12),
                  TextFields(
                    controller: universityController,
                    hintText: 'Cth: Universitas Ciputra',
                    obscureText: true,
                    color: const Color(0XFFEEEEEE),
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 12),
                  const Text('Jurusan'),
                  const SizedBox(height: 12),
                  TextFields(
                    controller: jurusanController,
                    hintText: 'Cth: Product Manager',
                    obscureText: true,
                    color: const Color(0XFFEEEEEE),
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 190),
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
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}