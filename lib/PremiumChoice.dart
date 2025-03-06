import 'package:elevateu_bcc_new/NavBar/homeScreen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PremiumChoice {
  final String title;
  final String description;
  final String price;
  final Widget button;

  PremiumChoice({
    required this.title,
    required this.description,
    required this.price,
    required this.button,
  });
}

List<PremiumChoice> pilihanPremium(BuildContext context) {
  return [
    PremiumChoice(
      title: 'Booster Pro',
      description: '* 1 Akun Premium\n'
          '* Pembatalan Kapan Saja\n'
          '* Berlangganan atau Sekali Bayar',
      price: 'Rp 100.000 selama 1 bulan',
      button: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00678D),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.white),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        child: Text(
          'Dapatkan Premium Individual',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight : FontWeight.bold,
          ),
        ),
      ),
    ),
    PremiumChoice(
      title: 'Challenge Pro',
      description: '* 1 Akun Premium\n'
          '* Pembatalan Kapan Saja\n'
          '* Berlangganan atau Sekali Bayar',
      price: 'Rp 100.000 selama 1 bulan',
      button: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00678D),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.white),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        child: Text(
          'Dapatkan Premium Individual',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    PremiumChoice(
      title: 'Ultimate Grow',
      description: '* 1 Akun Premium\n'
          '* Pembatalan Kapan Saja\n'
          '* Berlangganan atau Sekali Bayar',
      price: 'Rp 100.000 selama 1 bulan',
      button: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFBBC05),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.white),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        child: Text(
          'Dapatkan Premium Individual',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ];
}