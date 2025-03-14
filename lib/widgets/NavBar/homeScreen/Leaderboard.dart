import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 66,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Image.asset(
                              'assets/icons/Chevron_Left.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(width: 82),
                          Text(
                            'Leaderboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF141414),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 32,
                                width: 92,
                                decoration: BoxDecoration(
                                  color: Color(0XFF00678D),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        'Mingguan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 1.40,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 32,
                                width: 92,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFF4D86CD)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                        child: Text(
                                      'Bulanan',
                                      style: TextStyle(
                                        color: Color(0xFF00678C),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.40,
                                      ),
                                    ))),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 32,
                                width: 92,
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFF4D86CD)),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                        child: Text(
                                      'All Time',
                                      style: TextStyle(
                                        color: Color(0xFF00678C),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.40,
                                      ),
                                    ))),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 400,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 141,
                              child: Container(
                                width: 72,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: Image.asset(
                                        'assets/images/Rafael.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Rafael',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.40,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 61,
                                      height: 25,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFAE78B),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 30,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFFEEEEEE),
                                                shape: OvalBorder(),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  'assets/images/Coin.png',
                                                  width: 15,
                                                  height: 15,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '500',
                                              style: TextStyle(
                                                color: Color(0xFF193C68),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 1.50,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 60,
                              left: 30,
                              child: Container(
                                width: 72,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: Image.asset(
                                        'assets/images/Girl1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Lucia',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.40,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 61,
                                      height: 25,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFAE78B),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 30,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFFEEEEEE),
                                                shape: OvalBorder(),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  'assets/images/Coin.png',
                                                  width: 15,
                                                  height: 15,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '450',
                                              style: TextStyle(
                                                color: Color(0xFF193C68),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 1.50,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 73,
                              left: 250,
                              child: Container(
                                width: 72,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: Image.asset(
                                        'assets/images/Bapak.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Dean',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.40,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 61,
                                      height: 25,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFAE78B),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 30,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFFEEEEEE),
                                                shape: OvalBorder(),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  'assets/images/Coin.png',
                                                  width: 15,
                                                  height: 15,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '500',
                                              style: TextStyle(
                                                color: Color(0xFF193C68),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 1.50,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 195,
                              left: 10,
                              child: Image.asset(
                                'assets/images/#2.png',
                                height: 197,
                                width: 110,
                              ),
                            ),
                            Positioned(
                              top: 164,
                              left: 120,
                              child: Stack(children: [
                                Image.asset(
                                  'assets/images/#1.png',
                                  height: 223,
                                  width: 115,
                                ),
                                Positioned(
                                  top: 45,
                                  left: 35,
                                  child: Image.asset(
                                    'assets/images/1.png',
                                    width: 35,
                                    height: 79,
                                  ),
                                )
                              ]),
                            ),
                            Positioned(
                              top: 220,
                              left: 229,
                              child: Image.asset(
                                'assets/images/#3.png',
                                height: 165,
                                width: 120,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0XFFD6F4FF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              padding: const EdgeInsets.all(1),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color(0xFFAFAFAF)),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              width: 58,
                              height: 58,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset('assets/images/Madelyn.png'),
                            ),
                            SizedBox(width: 4,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Madelyn Chairan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 67,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFFBBC05),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 67,
                                      child: Text(
                                        '390 coin',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              padding: const EdgeInsets.all(1),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color(0xFFAFAFAF)),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset('assets/images/Madelyn.png'),
                            ),
                            SizedBox(width: 4,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Madelyn Chairan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 67,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFFBBC05),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 67,
                                      child: Text(
                                        '390 coin',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              padding: const EdgeInsets.all(1),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color(0xFFAFAFAF)),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset('assets/images/Madelyn.png'),
                            ),
                            SizedBox(width: 4,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Madelyn Chairan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 67,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFFBBC05),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 67,
                                      child: Text(
                                        '390 coin',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              padding: const EdgeInsets.all(1),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color(0xFFAFAFAF)),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset('assets/images/Madelyn.png'),
                            ),
                            SizedBox(width: 4,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Madelyn Chairan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 67,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFFBBC05),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 67,
                                      child: Text(
                                        '390 coin',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ])));
  }
}
