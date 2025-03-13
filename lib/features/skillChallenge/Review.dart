import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/TextField.dart';


class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController Submission = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Color(0XFFE4F8FF),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset(
                      'assets/icons/Chevron_Left.png',
                      color: Color(0XFF00678D),
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(width: 84),
                  Text(
                    'Review',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF00678D),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/VDivider.png',
                                height: 34,
                                width: 7,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Membuat To-Do List Sederhana',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF00678D),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text('Menggunakan JavaScript')
                                ],
                              ),
                              SizedBox(width: 100),
                              Image.asset(
                                'assets/icons/Dot3_Vertical.png',
                                height: 18,
                                width: 6,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Murid.png',
                            color: Colors.grey,
                            width: 17,
                            height: 17,
                          ),
                          SizedBox(width: 8),
                          Text('Mentor'),
                          Spacer(),
                          Image.asset(
                            'assets/icons/Date.png',
                            width: 18,
                            height: 18,
                          ),
                          SizedBox(width: 4),
                          Text('Tanggal'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/John.png',
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(width: 8),
                          Text('John Lewis B.Cs'),
                          Spacer(),
                          Text('12 Maret 2024')
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/LinkSubmission.png',
                                height: 27,
                                width: 310,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              TextFields(
                                enabled: true,
                                controller: Submission,
                                hintText: 'bit/ly.tugaschallenge',
                                obscureText: false,
                                color: Colors.transparent,
                                borderColor: Colors.black,
                              ),
                              SizedBox(height: 20),
                              Text('Review'),
                              Row(
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
                                  SizedBox(width: 8,),
                                  Text('20 Coin dari Mentor')
                                ],
                              ),
                              SizedBox(height: 6,),
                              Text('Penulisan code masih belum sistematis dan '
                                  'terstruktur, coba koreksi dibaris 45, gunakan '
                                  'CSS untuk menambahkan interkatif pengguna'
                              ),
                              SizedBox(height: 380,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}