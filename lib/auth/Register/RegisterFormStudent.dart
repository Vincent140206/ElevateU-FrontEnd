import 'package:elevateu_bcc_new/auth/Register/VerifikasiOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/TextField.dart';
import 'bloc/AuthEvent.dart';
import 'bloc/RegisterBloc.dart';

class SignupFormStudent extends StatefulWidget {
  const SignupFormStudent({Key? key}) : super(key: key);

  @override
  State<SignupFormStudent> createState() => SignupFormState();
}

class SignupFormState extends State<SignupFormStudent> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  void saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', addressController.text);
    await prefs.setString('university', universityController.text);
    await prefs.setString('jurusan', jurusanController.text);
    debugPrint('User  data saved: Address: ${addressController.text}, University: ${universityController.text}, Jurusan: ${jurusanController.text}');
  }

  void _validateAndProceed() async {
    if (addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alamat tidak boleh kosong')),
      );
      debugPrint('Validation failed: Address is empty');
      return;
    }
    if (universityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Universitas tidak boleh kosong')),
      );
      debugPrint('Validation failed: University is empty');
      return;
    }
    if (jurusanController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Jurusan tidak boleh kosong')),
      );
      debugPrint('Validation failed: Jurusan is empty');
      return;
    }

    saveUserData();

    String email = '';
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    debugPrint('Loaded email: $email');

    context.read<RegisterBloc>().add(RegisterSubmitted(email: email, name: '', password: '', role: ''));
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
          // Header Row
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
                      'Masukan data diri kamu yaaa>',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 34),
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
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    const Text('Jurusan'),
                    const SizedBox(height: 12),
                    TextFields(
                      controller: jurusanController,
                      hintText: 'Cth: Product Manager',
                      obscureText: false,
                      color: const Color(0XFFEEEEEE),
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 20),
                    Elevatedbutton1(
                      width: 356,
                      height: 48,
                      tulisan: 'Lanjutkan',
                      onPressed: _validateAndProceed,
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