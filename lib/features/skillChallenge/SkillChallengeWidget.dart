import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SkillChallengeList.dart';
import 'SkillChallengeScreen.dart';

class SkillChallengeWidget extends StatefulWidget {
  const SkillChallengeWidget({super.key});

  @override
  State<SkillChallengeWidget> createState() => _SkillChallengeWidgetState();
}

class _SkillChallengeWidgetState extends State<SkillChallengeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SkillChallengeScreen(scList: scList,)));
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
      ),
    );
  }
}