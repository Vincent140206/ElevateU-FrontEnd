import 'package:elevateu_bcc_new/NavBar/homeScreen/lists/skillBoostList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../NavBar/homeScreen/HomeScreen.dart';
import '../NavBar/homeScreen/lists/rekomendasiList.dart';
import 'SkillBoostScreen.dart';

class RekomendasiSkillBoost extends StatefulWidget {
  const RekomendasiSkillBoost({super.key});

  @override
  State<RekomendasiSkillBoost> createState() => _RekomendasiSkillBoostState();
}

class _RekomendasiSkillBoostState extends State<RekomendasiSkillBoost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 66,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset(
                    'assets/icons/Chevron_Left.png',
                    width: 23,
                    height: 23,
                  ),
                ),
                SizedBox(width: 24,),
                Text(
                  'Rekomendasi Skill Boost',
                  style: TextStyle(
                    color: Color(0xFF141414),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.40,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25,),
          SizedBox(
            height: 340,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 8),
              itemCount: rekList.length,
              itemBuilder: (context, index) {
                final rekomenList = rekList[index];
                return InkWell(
                  onTap: () {

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
                            width: 210,
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
        ],
      ),
    );
  }
}