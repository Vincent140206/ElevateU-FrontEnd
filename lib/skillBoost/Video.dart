import 'package:elevateu_bcc_new/NavBar/homeScreen/lists/skillBoostList.dart';
import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SBVideo extends StatefulWidget {
  final sbList sboost;
  const SBVideo({super.key,  required this.sboost});

  @override
  State<SBVideo> createState() => _SBVideoState();
}

class _SBVideoState extends State<SBVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                SizedBox(width: 15),
                Text(
                  widget.sboost.title,
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
            SizedBox(height: 20,),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.sboost.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 155,
                  child: Image.asset(
                     'assets/images/PlayTok.png',
                    width: 50,
                    height: 50,
                    )
                ),
                Positioned(
                    top: 70,
                    left: 245,
                    child: Image.asset(
                      'assets/images/Skip.png',
                      width: 50,
                      height: 50,
                    )
                ),
                Positioned(
                    top: 70,
                    left: 65,
                    child: Image.asset(
                      'assets/images/Back.png',
                      width: 50,
                      height: 50,
                    )
                ),
              ]
            ),
            SizedBox(height: 10,),
            Image.asset('assets/images/Progress.png'),
            SizedBox(height: 20,),
            Text(
              widget.sboost.title,
              style: TextStyle(
                color: Color(0xFF141414),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
            SizedBox(height: 10,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Video pembelajaran ini akan membahas dasar-dasar UX Design, mulai dari konsep fundamental, ',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  TextSpan(
                    text: 'Baca selengkapnya',
                    style: TextStyle(
                      color: Color(0xFF193C68),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 300,),
            Elevatedbutton1(
                tulisan: 'Lanjutkan',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                width: double.maxFinite,
                height: 48
            )
          ],
        ),
      ),
    );
  }
}
