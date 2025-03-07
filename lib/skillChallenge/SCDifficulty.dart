import 'package:elevateu_bcc_new/skillChallenge/SkillChallengeDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScDifficulty extends StatefulWidget {
  const ScDifficulty({super.key});

  @override
  State<ScDifficulty> createState() => _ScDifficultyState();
}

class _ScDifficultyState extends State<ScDifficulty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/SC_Bg.png'),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Image.asset(
                        'assets/icons/Chevron_Left.png',
                        color: Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(width: 84),
                    Text(
                      'Advanced',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SkillChallengeDetail()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 153,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                            padding: const EdgeInsets.only(top: 17, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text('Free'),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 290,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Color(0XFFFCF3C7),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: VerticalDivider(
                                              color: Color(0XFFD57C09),
                                              width: 15,
                                              thickness: 2,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Optimasi Performa Website'),
                                                SizedBox(height: 5),
                                                Text('Lazy Loading, Caching, dan Minifikasi')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                        'assets/icons/Dot3_Vertical.png',
                                        width: 4,
                                        height: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/Date.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text('12 Maret 2024'),
                                      Spacer(),
                                      Image.asset(
                                        'assets/images/Murid.png',
                                        color: Colors.grey,
                                        width: 17,
                                        height: 17,
                                      ),
                                      Text('12 Mahasiswa')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SkillChallengeDetail()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 153,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                            padding: const EdgeInsets.only(top: 17, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text('Challenge'),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 290,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Color(0XFFE4F8FF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: VerticalDivider(
                                              color: Color(0XFF214F8A),
                                              width: 15,
                                              thickness: 2,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Membuat E-Commerce'),
                                                SizedBox(height: 5),
                                                Text('Menggunakan React JS dan Tailwind CSS')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                        'assets/icons/Dot3_Vertical.png',
                                        width: 4,
                                        height: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/Date.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text ('12 Maret 2024'),
                                      Spacer(),
                                      Image.asset(
                                        'assets/images/Murid.png',
                                        color: Colors.grey,
                                        width: 17,
                                        height: 17,
                                      ),
                                      Text('12 Mahasiswa')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SkillChallengeDetail()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 153,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                            padding: const EdgeInsets.only(top: 17, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text('Challenge'),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 290,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Color(0XFFE4F8FF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: VerticalDivider(
                                              color: Color(0XFF214F8A),
                                              width: 15,
                                              thickness: 2,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Pembuatan Dashboard Admin'),
                                                SizedBox(height: 5),
                                                Text('Menggunakan Next.js dan GraphQL')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                        'assets/icons/Dot3_Vertical.png',
                                        width: 4,
                                        height: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/Date.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text('12 Maret 2024'),
                                      Spacer(),
                                      Image.asset(
                                        'assets/images/Murid.png',
                                        color: Colors.grey,
                                        width: 17,
                                        height: 17,
                                      ),
                                      Text('12 Mahasiswa')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SkillChallengeDetail()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 153,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                            padding: const EdgeInsets.only(top: 17, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text('Challenge'),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 290,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Color(0XFFE4F8FF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: VerticalDivider(
                                              color: Color(0XFF214F8A),
                                              width: 15,
                                              thickness: 2,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Website E-Commerce Responsif'),
                                                SizedBox(height: 5),
                                                Text('Menggunakan React JS dan Tailwind CSS')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                        'assets/icons/Dot3_Vertical.png',
                                        width: 4,
                                        height: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/Date.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text('12 Maret 2024'),
                                      Spacer(),
                                      Image.asset(
                                        'assets/images/Murid.png',
                                        color: Colors.grey,
                                        width: 17,
                                        height: 17,
                                      ),
                                      Text('12 Mahasiswa')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}