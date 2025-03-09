import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SCDifficulty.dart';
import 'SkillChallengeList.dart';

class SkillChallengeScreen extends StatefulWidget {
  final SkillChallengeList scList;
  const SkillChallengeScreen({super.key, required this.scList});

  @override
  State<SkillChallengeScreen> createState() => _SkillChallengeScreenState();
}

class _SkillChallengeScreenState extends State<SkillChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                SizedBox(width: 10),
                Text(
                  'Skill Challenge',
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
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.scList.ImagePath,
                    width: double.infinity,
                    height: 170,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.scList.Title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(widget.scList.Challenge, style: TextStyle(fontSize: 18)),
                SizedBox(height: 10,),
                Text(
                    'Selamat datang di Front-End Developer Skill Challenge! '
                    'Challenge ini dirancang untuk menguji, mengasah, dan meningkatkan '
                    'keterampilanmu dalam membangun antarmuka web yang interaktif, responsif, '
                    'dan user-friendly.'
                ),
                SizedBox(height: 4,),
                Divider(),
                SizedBox(height: 4,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScDifficulty()));
                  },
                  child: Container(
                    height: 71,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFA4E6FF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 13, bottom: 13, right: 8),
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/images/SC_PapanDada.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Beginner'),
                              SizedBox(height: 4,),
                              Text('Penerapan Dasar HTML dan CSS')
                            ],
                          ),
                          Spacer(),
                          Row(
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
                              SizedBox(width: 6,),
                              Text('100')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 71,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFF30C8FF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, top: 13, bottom: 13, right: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/SC_PapanDada.png',
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Intermediate'),
                            SizedBox(height: 4,),
                            Text('Web Interaktif dengan JavaScript dan API')
                          ],
                        ),
                        Spacer(),
                        Row(
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
                            SizedBox(width: 6,),
                            Text('100')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 71,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFF00678D),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, top: 13, bottom: 13, right: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/SC_PapanDada.png',
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Advance',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                                'Web dinamis menggunakan React',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
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
                            SizedBox(width: 6,),
                            Text('100')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}