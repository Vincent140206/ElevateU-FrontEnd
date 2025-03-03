import 'package:elevateu_bcc/screens/auth/LoginScreen.dart';
import 'package:elevateu_bcc/screens/auth/recovery/RecoveryEmail.dart';
import 'package:elevateu_bcc/widgets/Button.dart';
import 'package:flutter/material.dart';

class Lupakatasandi extends StatefulWidget {
  const Lupakatasandi({super.key});

  @override
  State<Lupakatasandi> createState() => _LupakatasandiState();
}

class _LupakatasandiState extends State<Lupakatasandi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 62),
          Row(
            children: [
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
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
                  "Lupa Kata Sandi",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Pilihlah opsi berikut untuk mengirim link reset \npassword',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 47),
                Column(
                  children: [
                    const SizedBox(height: 18),
                    Button1(
                        iconPath: 'assets/icons/Email.png',
                        title: 'Reset via email',
                        subtitle: 'Jika kamu memiliki email  di akun',
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RecoveryEmail()));
                        }
                    )
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}