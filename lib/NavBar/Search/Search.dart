import 'package:elevateu_bcc_new/NavBar/homeScreen/lists/skillBoostList.dart';
import 'package:elevateu_bcc_new/skillBoost/SkillBoostScreen.dart';
import 'package:elevateu_bcc_new/widgets/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 66, left: 20, right: 20),
            child: TextFields(
              controller: searchController,
              hintText: 'Cari Skillmu disini',
              obscureText: false,
              color: Colors.transparent,
              borderColor: Color(0xFF4D86CD),
            ),
          ),
          SizedBox(height: 21),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skill Boost',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skill Guidance',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skill Challenge',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                        width:  14,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}