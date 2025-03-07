import 'package:elevateu_bcc_new/NavBar/homeScreen/lists/mentorList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillGuidanceWidget extends StatefulWidget {
  const SkillGuidanceWidget({super.key});

  @override
  State<SkillGuidanceWidget> createState() => _SkillGuidanceWidgetState();
}

class _SkillGuidanceWidgetState extends State<SkillGuidanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100),
          Expanded(
            child: ListView.builder(
              itemCount: mentorList.length,
              itemBuilder: (context, index) {
                final mentor = mentorList[index];
                return InkWell(
                  onTap: () {
                    // Handle tap
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      width: double.maxFinite,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              mentor.imagePath,
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    mentor.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        mentor.speciality,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Text(mentor.challenge)
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Star.png',
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        mentor.review,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(mentor.price)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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