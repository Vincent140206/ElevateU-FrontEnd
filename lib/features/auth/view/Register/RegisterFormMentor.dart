import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../../widgets/ElevatedButton.dart';
import '../../../../widgets/TextField.dart';
import '../../bloc/RegisterBloc.dart';
import '../../bloc/RegisterEvent.dart';
import '../VerifikasiOTP.dart';

class SignupFormMentor extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const SignupFormMentor({super.key, required this.name, required this.email, required this.password});

  @override
  State<SignupFormMentor> createState() => _SignupFormMentorState();
}

class _SignupFormMentorState extends State<SignupFormMentor> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController keahlianController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController perusahaanController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  Future<void> saveMentorData() async {
    final localStorageService = LocalStorageService();
    await localStorageService.saveMentorData(
        numberController.text,
        addressController.text,
        keahlianController.text,
        posisiController.text,
        perusahaanController.text,
        genderController.text
    );
  }

  void _validateAndProceed() async {
    if (numberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nomor HP tidak boleh kosong')),
      );
      return;
    }
    if (addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alamat tidak boleh kosong')),
      );
      return;
    }
    if (keahlianController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bidang keahlian tidak boleh kosong')),
      );
      return;
    }
    if (posisiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Posisi saat ini tidak boleh kosong')),
      );
      return;
    }
    if (perusahaanController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perusahaan tidak boleh kosong')),
      );
      return;
    }
    if (genderController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gender tidak boleh kosong')),
      );
      return;
    }

    String gender = genderController.text.toLowerCase();
    if (gender != 'male' && gender != 'female') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gender harus "male" atau "female"')),
      );
      return;
    }

    await saveMentorData();

    String email = '';
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    debugPrint('Loaded email: $email');
    context.read<RegisterBloc>().add(RegisterSubmitted(email: email));
    debugPrint('RegisterSubmitted event dispatched with email: $email');

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const VerifikasiOtp()),
    );
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
                    const Text('No Hp', style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 11),
                    TextFields(
                      enabled: true,
                      controller: numberController,
                      hintText: '0812-5678-9010',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Color(0XFFFBBC05),
                    ),
                    const SizedBox(height: 12),
                    const Text('Alamat'),
                    const SizedBox(height: 12),
                    TextFields(
                      enabled: true,
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
                      enabled: true,
                      controller: keahlianController,
                      hintText: 'Cth: Programmer',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Posisi Saat Ini'),
                    const SizedBox(height: 12),
                    TextFields(
                      enabled: true,
                      controller: posisiController,
                      hintText: 'Cth: Product Manager',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Perusahaan atau Organisasi'),
                    const SizedBox(height: 12),
                    TextFields(
                      enabled: true,
                      controller: perusahaanController,
                      hintText: 'Cth: Microsoft',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Gender'),
                    const SizedBox(height: 12),
                    TextFields(
                      enabled: true,
                      controller: genderController,
                      hintText: 'Male/Female',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 30),
                    Elevatedbutton1(
                      width: 356,
                      height: 48,
                      tulisan: 'Lanjutkan',
                      onPressed: _validateAndProceed,
                    ),
                    const SizedBox(height: 30),
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