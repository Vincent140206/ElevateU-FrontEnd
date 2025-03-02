import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 31, top: 81),
          child: Column(
            children: [
              const SizedBox(
                width: 365,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Let’s Elevate Your \nSkill Rafael ',
                              style: TextStyle(
                                color: Color(0xFF141414),
                                fontSize: 30,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 1.27,
                              ),
                            ),
                          ),
                          SizedBox(width: 60),
                          Icon(Icons.notifications, size: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 29),
              Container(
                padding: const EdgeInsets.only(top: 14, left: 12),
                height: 100,
                width: 353,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(1.00, -0.04),
                    end: Alignment(-1, 0.04),
                    colors: [
                      Color(0XFF1D7899),
                      Color(0XFF30C8FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fundamental Front \nEnd Developer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Yuk lanjutkan progres belajarmu hari ini!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 12, bottom: 11),
                width: 353,
                height: 58,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Container(
                       width: 30,
                       height: 30,
                       decoration: const ShapeDecoration(
                         color: Color(0xFFEEEEEE),
                         shape: OvalBorder(),
                       ),
                       child: Center(
                         child: Image.asset(
                           'assets/images/Coin.png',
                           width: 20,
                           height: 20,
                           fit: BoxFit.scaleDown,
                         ),
                       ),
                     ),
                     const SizedBox(width: 12,),
                     const Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('50 Coins'),
                         Text(
                           '4 Voucher tersedia',
                           style: TextStyle(
                             color: Color(0xFF7C7C7C),
                             fontSize: 12,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w400,
                             height: 1.50,
                           ),
                         ),
                       ],
                     ),
                     Container(
                       width: 30,
                       height: 30,
                       decoration: const ShapeDecoration(
                         color: Color(0xFFEEEEEE),
                         shape: OvalBorder(),
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