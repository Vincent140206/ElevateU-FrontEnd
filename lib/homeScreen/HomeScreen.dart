import 'package:elevateu_bcc/homeScreen/lists/rekomendasiList.dart';
import 'package:elevateu_bcc/homeScreen/lists/skillBoostList.dart';
import 'package:elevateu_bcc/homeScreen/lists/skillUpgradeList.dart';
import 'package:flutter/material.dart';
import 'lists/kategoriList.dart';
import 'lists/mentorList.dart';
import 'lists/skillChallengeList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalHeight = rekList.length * 90;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 81),
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
                width: 380,
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
                width: 380,
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
                    const SizedBox(width: 12),
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
                    const Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF00678D),
                        shape: OvalBorder(),
                      ),
                      child: Image.asset(
                        'assets/images/Titik3.png',
                        scale: 4,
                      ),
                    ),
                    const SizedBox(width: 13)
                  ],
                ),
              ),
              const SizedBox(height: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Kategori',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Text('Selengkapnya')
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 44,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: kategoriList.length,
                      itemBuilder: (context, index) {
                        final kategori = kategoriList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    kategori.iconPath,
                                    width: 15,
                                    height: 21,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(kategori.name),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 17),
                  Row(
                    children: [
                      Text(
                        'Skill Guidance',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Text('Selengkapnya'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 99,
                    width: 365,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mentorList.length,
                      itemBuilder: (context, index) {
                        final mentor = mentorList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Card(
                                color: Colors.white,
                                margin: EdgeInsets.all(8),
                                shape: CircleBorder(),
                                child: Image.asset(
                                  mentor.imagePath,
                                  width: 59,
                                  height: 59,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(mentor.name),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 23),
                  Row(
                    children: [
                      Text('Skill Boost'),
                      const Spacer(),
                      Text('Selengkapnya')
                    ],
                  ),
                  const SizedBox(height: 17),
                  SizedBox(
                    height: 223,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: skillBoostList.length,
                      itemBuilder: (context, index) {
                        final skillBoost = skillBoostList[index];
                        return Container(
                          width: 172,
                          margin: const EdgeInsets.only(right: 12),
                          child: Material(
                            color: Colors.white,
                            elevation: 1,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 122,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(skillBoost.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(6),
                                        child: Text(
                                          skillBoost.title,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 4),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/Course.png',
                                              width: 14,
                                              height: 14,
                                            ),
                                            Text(skillBoost.materi),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 4),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/Star.png',
                                              width: 14,
                                              height: 14,
                                            ),
                                            SizedBox(width: 4,),
                                            Text(skillBoost.review),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 23),
                  Row(
                    children: [
                      Text('Skill Challenge'),
                      const Spacer(),
                      Text('Selengkapnya')
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 139,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: skillChallengeList.length,
                      itemBuilder: (context, index) {
                        final skillChallenge = skillChallengeList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 321,
                            height: 139,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  skillChallenge.imagePath,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 23),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0XFF00678D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/Kertas.png'),
                          SizedBox(width: 10),
                          Text(
                            'Yuk Buat Portofoliomu Sekarang!',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(),
                            ),
                            child: Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Skill Upgrade'),
                      const Spacer(),
                      Text('Selengkapnya')
                    ],
                  ),
                  SizedBox(height: 17,),
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: suList.length,
                      itemBuilder: (context, index) {
                        final skillUpgrade = suList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 255,
                              height: 300,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 148,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(skillUpgrade.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 14),
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            skillUpgrade.title,
                                            style: TextStyle(
                                              color: Color(0xFF141414),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 1.40,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/Tanggal.png',
                                                width: 17,
                                                height: 17
                                            ),
                                            SizedBox(width: 9,),
                                            Text(skillUpgrade.tanggal),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 20,
                                              padding: const EdgeInsets.all(10),
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFF2F2F2),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                              ),
                                              child: Text(
                                                'Umum',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.50,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 28,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text('Rekomendasi Skill Boost'),
                        const Spacer(),
                        Text('Selengkapnya')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      itemCount: rekList.length,
                      itemBuilder: (context, index) {
                        final rekomenList = rekList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8, bottom: 8),
                            width: 380,
                            height: 90,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 106,
                                    height: 74,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        rekomenList.imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  SizedBox(
                                    width: 200,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            rekomenList.title,
                                            style: TextStyle(
                                              color: Color(0xFF141414),
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 1.40,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 18,
                                              height: 18,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: Image.asset(rekomenList.mentorImagePath),
                                              ),
                                            ),
                                            const SizedBox(width: 9),
                                            Text(
                                              rekomenList.name,
                                              style: TextStyle(
                                                color: Color(0xFF2F2F2F),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 1.50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/Star.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                            SizedBox(width: 9),
                                            Text(rekomenList.review),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}