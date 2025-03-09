import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/auth/Register/VerifikasiOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/TextField.dart';
import 'bloc/AuthEvent.dart';
import 'bloc/OtpBloc.dart';
import 'bloc/RegisterBloc.dart';
import 'bloc/RegisterBloc.dart';

class VerifikasiOtp extends StatefulWidget {
  const VerifikasiOtp({super.key});

  @override
  State<VerifikasiOtp> createState() => _VerifikasiOtpState();
}

class _VerifikasiOtpState extends State<VerifikasiOtp> {
  final List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPBloc(Dio()),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 62),
              Row(
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
                    'Verifikasi OTP',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 60),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verifikasi Kode OTP",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Silakan masukkan kode yang dikirim ke email',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        return Container(
                          width: 40,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            controller: controllers[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: const TextStyle(
                              color: Color(0xFF141414),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.27,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: '*',
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Ada masalah?',
                          style: TextStyle(
                            color: Color(0xFF5B5B5B),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                        const SizedBox(width: 9),
                        TextButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            String email = prefs.getString('email') ?? '';
                            if (email.isNotEmpty) {
                              context.read<RegisterBloc>().add(
                                RegisterSubmitted(
                                  email: email, name: '', password: '', role: '',
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Email tidak ditemukan')),
                              );
                            }
                          },
                          child: const Text(
                            'Kirim ulang kode',
                            style: TextStyle(
                              color: Color(0xFF193C68),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: Container(
                        width: 253,
                        height: 253,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/OTP.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    BlocListener<OTPBloc, OtpState>(
                      listener: (context, state) {
                        if (state is OtpLoading) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Loading...')),
                          );
                        } else if (state is OtpSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('OTP validated successfully!')),
                          );
                        } else if (state is OtpFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: ${state.error}')),
                          );
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () async {
                          String otp = controllers.map((controller) => controller.text).join();
                          if (otp.length == 6) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('otp', otp);
                            context.read<OTPBloc>().add(OTPSubmitted(otp));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Harap masukkan semua digit OTP')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00678D),
                          minimumSize: const Size(365, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Kirim Verifikasi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}