import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MentorScreen.dart';
import '../homeScreen/lists/mentorList.dart';

class MentorChat extends StatefulWidget {
  const MentorChat({super.key});

  @override
  State<MentorChat> createState() => _MentorChatState();
}

class _MentorChatState extends State<MentorChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 66, left: 20, right: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Mentor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: mentorList.length,
                itemBuilder: (context, index) {
                  final mentor = mentorList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MentorScreen(mentorList: mentor,)));
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 92,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
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
                                      SizedBox(height: 2),
                                      Text(
                                        mentor.speciality,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Text('Kamu bisa menggunakan beberapa ...')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider()
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
      ),
    );
  }
}