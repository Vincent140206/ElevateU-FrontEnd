import 'package:flutter/material.dart';
import '../../TextField.dart';
import '../../../features/skillChallenge/SkillChallengeList.dart';
import '../../../features/skillChallenge/SkillChallengeScreen.dart';
import '../../../features/skillBoost/SkillBoostScreen.dart';
import '../Mentor/MentorScreen.dart';
import '../homeScreen/lists/mentorList.dart';
import '../homeScreen/lists/skillBoostList.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedCategory = 'Skill Boost';

  Widget skillBoost() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height - 200,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: skillBoostList.length,
        itemBuilder: (context, index) {
          final skboost = skillBoostList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SkillBoostScreen(sboost: skboost),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      skboost.imagePath,
                      height: 114,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          skboost.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Course.png',
                              width: 14,
                              height: 14,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                skboost.materi,
                                style: TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Star.png',
                              width: 17,
                              height: 17,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                skboost.review,
                                style: TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget skillChallenge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height - 200,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.35,
        ),
        itemCount: SCList.length,
        itemBuilder: (context, index) {
          final scList = SCList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SkillChallengeScreen(scList: scList),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.asset(
                    scList.ImagePath,
                    height: 65,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 4),
                  Center(
                    child: Column(
                      children: [
                        Text(scList.Title),
                        Text(scList.Challenge),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget skillGuidance() {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
        itemCount: mentorList.length,
        itemBuilder: (context, index) {
          final mentor = mentorList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MentorScreen(mentorList: mentor,)));
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
                                SizedBox(width: 8),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
              child: TextFields(
                controller: searchController,
                hintText: 'Cari Skillmu disini',
                obscureText: false,
                color: Colors.transparent,
                borderColor: Color(0xFF4D86CD),
                enabled: true,
              ),
            ),
            SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Skill Boost';
                      });
                    },
                    child: Text(
                      'Skill Boost',
                      style: TextStyle(
                        color: selectedCategory == 'Skill Boost' ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Skill Challenge';
                      });
                    },
                    child: Text(
                      'Skill Challenge',
                      style: TextStyle(
                        color: selectedCategory == 'Skill Challenge' ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Skill Guidance';
                      });
                    },
                    child: Text(
                      'Skill Guidance',
                      style: TextStyle(
                        color: selectedCategory == 'Skill Guidance' ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: selectedCategory == 'Skill Boost'
                  ? skillBoost()
                  : selectedCategory == 'Skill Challenge'
                  ? skillChallenge()
                  : skillGuidance(),
            ),
          ],
        ),
      ),
    );
  }
}