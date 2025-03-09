import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PremiumChoice {
  final String title;
  final String description;
  final String price;

  PremiumChoice({
    required this.title,
    required this.description,
    required this.price,
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
    ),
    PremiumChoice(
      title: 'Challenge Pro',
      description: '* 1 Akun Premium\n'
          '* Pembatalan Kapan Saja\n'
          '* Berlangganan atau Sekali Bayar',
      price: 'Rp 100.000 selama 1 bulan',
    ),
    PremiumChoice(
      title: 'Ultimate Grow',
      description: '* 1 Akun Premium\n'
          '* Pembatalan Kapan Saja\n'
          '* Berlangganan atau Sekali Bayar',
      price: 'Rp 100.000 selama 1 bulan',
    ),
  ];
}