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
                  SizedBox(height: 24,),
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
                        Container(
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
                          child: Text("HALOOOOOOOOOOOOO"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
