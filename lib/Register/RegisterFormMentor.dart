import 'package:flutter/material.dart';

import '../screens/auth/LoginScreen.dart';
import '../widgets/ElevatedButton.dart';
import '../widgets/PopUp.dart';
import '../widgets/TextField.dart';

class SignupFormMentor extends StatefulWidget {
  const SignupFormMentor({super.key});

  @override
  State<SignupFormMentor> createState() => _SignupFormMentorState();
}
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController keahlianController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController perusahaanController = TextEditingController();

class _SignupFormMentorState extends State<SignupFormMentor> {
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
                      const Text('Bidang Keahlian'),
                      const SizedBox(height: 12),
                      TextFields(
                        controller: keahlianController,
                        hintText: 'Cth: Programmer',
                        obscureText: true,
                        color: const Color(0XFFEEEEEE),
                        borderColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      const Text('Posisi Saat Ini'),
                      const SizedBox(height: 12),
                      TextFields(
                        controller: posisiController,
                        hintText: 'Cth: Product Manager',
                        obscureText: true,
                        color: const Color(0XFFEEEEEE),
                        borderColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      const Text('Perusahaan atau Organisasi'),
                      const SizedBox(height: 12),
                      TextFields(
                        controller: perusahaanController,
                        hintText: 'Cth: Microsoft',
                        obscureText: true,
                        color: const Color(0XFFEEEEEE),
                        borderColor: Colors.transparent,
                      ),
                      const SizedBox(height: 12),
                      const Text('Bukti Surat Kerja / Pengalaman'),
                      const SizedBox(height: 12),
                      Container(
                        height: 164,
                        width: 365,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Image.asset(
                              'assets/images/Upload.png',
                              width: 49,
                              height: 65,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 30),
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