import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:elevateu_bcc_new/widgets/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Review.dart';

class SkillChallengeDetail extends StatefulWidget {
  const SkillChallengeDetail({super.key});

  @override
  State<SkillChallengeDetail> createState() => _SkillChallengeDetailState();
}

class _SkillChallengeDetailState extends State<SkillChallengeDetail> {
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
                    'Challenge',
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
                                  SizedBox(height: 8,),
                                  Text('Menggunakan JavaScript')
                                ],
                              ),
                              SizedBox(width: 100,),
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
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/Date.png',
                            width: 18,
                            height: 18,
                          ),
                          SizedBox(width: 4),
                          Text('12 Maret 2024'),
                          Spacer(),
                          Image.asset(
                            'assets/images/Murid.png',
                            color: Colors.grey,
                            width: 17,
                            height: 17,
                          ),
                          Text('12 Mahasiswa')
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 285,
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
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/images/KacaPembesar.png',
                                    width: 157,
                                    height: 27,
                                  )
                                ],
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('1. Menambahkan tugas baru ke dalam daftar\n'
                                    '2. Menandai tugas sebagai selesai dengan efek visual (misalnya teks dicoret)\n'
                                    '3. Menghapus tugas dari daftar\n'
                                    '4. Menyimpan daftar tugas di local storage agar tetap ada saat halaman di-refresh.'
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/images/Tools.png',
                                    height: 46,
                                    width: 212,
                                  ),
                                  SizedBox(height: 8,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('1. HTML → Struktur dasar halaman\n'
                                    '2. CSS → Styling agar tampilan menarik\n'
                                    '3. JavaScript → Mengelola interaksi pengguna\n'
                                    '4. Local Storage → Menyimpan data secara lokal di browser'
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
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
                          SizedBox(height: 10,),
                          Column(
                            children: [
                              Text('1. Pastikan Gunakan Link Google Drive dalam pengumpulan\n'
                                '2. Pastikan file pengumpulan berupa PDF\n'
                              ),
                              SizedBox(height: 4,),
                              TextFields(
                                  enabled: true,
                                  controller: Submission,
                                  hintText: 'bit/ly.tugaschallenge',
                                  obscureText: false,
                                  color: Colors.transparent,
                                  borderColor: Colors.black
                              ),
                              SizedBox(height: 20,),
                              Elevatedbutton1(
                                  tulisan: 'Submit',
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewScreen()));
                                  },
                                  width: 370,
                                  height: 48
                              ),
                              SizedBox(height: 107,)
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