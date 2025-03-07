import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UlasanWidget1 extends StatefulWidget {
  const UlasanWidget1({super.key});

  @override
  State<UlasanWidget1> createState() => _UlasanWidget1State();
}

class _UlasanWidget1State extends State<UlasanWidget1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(height: 100,),
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
                                        Text('4/5'),
                                        SizedBox(width: 136,),
                                        Text('22/09/2024')
                                      ],
                                    ),
                                  ],
                                ),
                              ]
                            ),
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
                            Text('Materinya disampaikan dengan cara yang engaging dan tidak membosankan. Contoh kasus yang diberikan sangat membantu memahami konsepnya. ')
                          ],
                        )
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
