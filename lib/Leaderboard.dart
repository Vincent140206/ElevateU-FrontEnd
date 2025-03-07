import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 66,),
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
                    onTap: () {

                    },
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
                          child: Text('Mingguan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.40,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 18,),
                  GestureDetector(
                    onTap: () {

                    },
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
                            child: Text('Bulanan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 18,),
                  GestureDetector(
                    onTap: () {

                    },
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
                            child: Text('All Time',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 1.40,
                              ),
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 36,),
            Container(
              width: double.maxFinite,

            )
          ],
        ),
      ),
    );
  }
}
