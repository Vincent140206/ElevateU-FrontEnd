import 'package:flutter/material.dart';
import 'EditProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 44,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Center(
                  child: Text('Profil'),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 67,
                    height: 67,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/images/Rafael.png'),
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rafael Jacob Hansen '),
                      Text('rafaeljacob@gmail.com')
                    ],
                  )
                ],
              ),
              SizedBox(height: 63,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0x4C87B4EC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 19,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text('Data Diri'),
                        Spacer(),
                        Icon(Icons.navigate_next_sharp,size: 30,)
                      ],
                    ),
                  ),
                  SizedBox(height: 34,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color(0x4C87B4EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings_outlined,
                            size: 19,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('Pengaturan'),
                      Spacer(),
                      Icon(Icons.navigate_next_sharp,size: 30,)
                    ],
                  ),
                  SizedBox(height: 34,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color(0x4C87B4EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.language,
                            size: 19,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('Bahasa'),
                      Spacer(),
                      Icon(Icons.navigate_next_sharp,size: 30,)
                    ],
                  ),
                  SizedBox(height: 34,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color(0x4C87B4EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/LifeBuoy.png',
                            width: 15,
                            height: 15,
                          )
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('Bantuan'),
                      Spacer(),
                      Icon(Icons.navigate_next_sharp,size: 30,)
                    ],
                  ),
                  SizedBox(height: 27,),
                  Divider(),
                  SizedBox(height: 27,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color(0x4C87B4EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.question_answer_outlined,
                            size: 19,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('FAQs'),
                      Spacer(),
                      Icon(Icons.navigate_next_sharp,size: 30,)
                    ],
                  ),
                  SizedBox(height: 34,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color(0x4C87B4EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.info_outline,
                            size: 19,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('About App'),
                      Spacer(),
                      Icon(Icons.navigate_next_sharp,size: 30,)
                    ],
                  ),
                  SizedBox(height: 34,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color(0x4C87B4EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.output,
                            size: 19,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text('Keluar'),
                      Spacer(),
                      Icon(Icons.navigate_next_sharp,size: 30,)
                    ],
                  ),
                  SizedBox(height: 34,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
