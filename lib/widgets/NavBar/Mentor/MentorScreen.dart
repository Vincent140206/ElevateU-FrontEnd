import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/Premium/Premium.dart';
import '../homeScreen/lists/mentorList.dart';

class MentorScreen extends StatefulWidget {
  final MentorList mentorList;
  const MentorScreen({super.key, required this.mentorList});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Container(
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
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Profil Mentor',
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
                SizedBox(height: 8,),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        widget.mentorList.imagePath,
                        width: 89,
                        height: 89,
                      ),
                      SizedBox(height: 8,),
                      Text(widget.mentorList.name),
                      SizedBox(height: 4,),
                      Text(widget.mentorList.speciality),
                      SizedBox(height: 4,),
                      Text(widget.mentorList.price)
                    ],
                  ),
                ),
                SizedBox(height: 26,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Student'),
                      SizedBox(width: 15,),
                      Text('Pengalaman'),
                      SizedBox(width: 10,),
                      Text("Rating")
                    ],
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                        'assets/images/Murid2.png',
                      height: 22,
                      width: 91,
                    ),
                    SizedBox(width: 15,),
                    Image.asset(
                        'assets/images/Ceklis_Pengalaman.png',
                      width: 131,
                      height: 23,
                    ),
                    SizedBox(width: 15,),
                    Image.asset(
                        'assets/images/Bintang_Rating.png',
                      width: 100,
                      height: 22,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text('Tentang')),
                    SizedBox(height: 6,),
                    Text(
                        'Sebagai seorang UX Designer di Tokopedia, saya memiliki '
                        'passion dalam menciptakan pengalaman digital yang intuitif, '
                        'menarik, dan user-centric. Dengan pendekatan berbasis data '
                        'dan desain yang human-centered, saya berfokus pada pengembangan '
                        'solusi yang tidak hanya memperindah tampilan, tetapi juga meningkatkan '
                        'keterlibatan dan kepuasan pengguna.'
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Ulasan")
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              'assets/images/Bintang_Riview.png',
                              width: 71,
                              height: 18,
                            ),
                            Text('(2.226)')
                          ],
                        ),
                        SizedBox(width: 8,),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/Riview_Bar.png',
                              width: 217,
                              height: 4,
                            ),
                            SizedBox(height: 8,),
                            Image.asset(
                              'assets/images/Riview_Bar.png',
                              width: 217,
                              height: 4,
                            ),
                            SizedBox(height: 8,),
                            Image.asset(
                              'assets/images/Riview_Bar.png',
                              width: 217,
                              height: 4,
                            ),
                            SizedBox(height: 8,),
                            Image.asset(
                              'assets/images/Riview_Bar.png',
                              width: 217,
                              height: 4,
                            ),
                            SizedBox(height: 8,),
                            Image.asset(
                              'assets/images/Riview_Bar.png',
                              width: 217,
                              height: 4,
                            )
                          ],
                        ),
                        SizedBox(width: 25,),
                        Icon(Icons.info_outline)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Text('Beri rating dan ulas')
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Rafael.png',
                                width: 46,
                                height: 46,
                              ),
                              SizedBox(width: 10,),
                              Image.asset(
                                'assets/images/Riview_Kosong.png',
                                width: 50,
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/Riview_Kosong.png',
                                width: 50,
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/Riview_Kosong.png',
                                width: 50,
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/Riview_Kosong.png',
                                width: 50,
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/Riview_Kosong.png',
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Divider(),
                          SizedBox(height: 20,),
                          Column(
                            children: [
                              Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Rafael.png',
                                      width: 46,
                                      height: 46,
                                    ),
                                    SizedBox(width: 8,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Fera Yunita'),
                                        SizedBox(height: 2,),
                                        Row(
                                          children: [
                                            Image.asset('assets/images/Bintang_Riview.png',
                                              width: 75,
                                              height: 10,
                                            ),
                                            SizedBox(width: 4,),
                                            Text('5/5'),
                                            SizedBox(width: 136,),
                                            Text('22/09/2024')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]
                              ),
                              SizedBox(height: 5,),
                              Text('Materinya disampaikan dengan cara yang engaging dan tidak membosankan. Contoh kasus yang diberikan sangat membantu memahami konsepnya. ')
                            ],
                          ),
                          SizedBox(height: 20,),
                          Column(
                            children: [
                              Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Rafael.png',
                                      width: 46,
                                      height: 46,
                                    ),
                                    SizedBox(width: 8,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Fera Yunita'),
                                        SizedBox(height: 2,),
                                        Row(
                                          children: [
                                            Image.asset('assets/images/Bintang_Riview.png',
                                              width: 75,
                                              height: 10,
                                            ),
                                            SizedBox(width: 4,),
                                            Text('4/5'),
                                            SizedBox(width: 136,),
                                            Text('22/09/2024')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]
                              ),
                              SizedBox(height: 5,),
                              Text('Materinya disampaikan dengan cara yang engaging dan tidak membosankan. Contoh kasus yang diberikan sangat membantu memahami konsepnya. ')
                            ],
                          ),
                          SizedBox(height: 20,),
                          Column(
                            children: [
                              Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Rafael.png',
                                      width: 46,
                                      height: 46,
                                    ),
                                    SizedBox(width: 8,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Fera Yunita'),
                                        SizedBox(height: 2,),
                                        Row(
                                          children: [
                                            Image.asset('assets/images/Bintang_Riview.png',
                                              width: 75,
                                              height: 10,
                                            ),
                                            SizedBox(width: 4,),
                                            Text('4/5'),
                                            SizedBox(width: 136,),
                                            Text('22/09/2024')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]
                              ),
                              SizedBox(height: 5,),
                              Text('Materinya disampaikan dengan cara yang engaging dan tidak membosankan. Contoh kasus yang diberikan sangat membantu memahami konsepnya. '),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/images/Chat.png',
                                    width: 48,
                                    height: 48,
                                  ),
                                  SizedBox(width: 10,),
                                  Elevatedbutton1(
                                      tulisan: "Enroll",
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumScreen()));
                                      },
                                      width: 294,
                                      height: 48
                                  ),
                                ],
                              ),
                              SizedBox(height: 40,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}
