import 'package:flutter/material.dart';

import '../../TextField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController universitasController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Data Personal',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 1.40,
          ),
        ),
        leading:
        IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              'assets/icons/Chevron_Left.png',
              width: 24,
              height: 24,
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14,),
              Center(
                child: Image.asset(
                    'assets/images/Rafael.png',
                  width: 87,
                  height: 87,
                ),
              ),
              SizedBox(height: 40,),
              Text('Nama'),
              SizedBox(height: 12,),
              TextFields(
                  controller: nameController,
                  hintText: 'Rafael Jacob Hansen',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('Email'),
              SizedBox(height: 12,),
              TextFields(
                  controller: emailController,
                  hintText: 'user@example.com',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('Role'),
              SizedBox(height: 12,),
              TextFields(
                  controller: roleController,
                  hintText: 'Student',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('Kata Sandi'),
              SizedBox(height: 12,),
              TextFields(
                  controller: passwordController,
                  hintText: '*******',
                  obscureText: true,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('No Hp'),
              SizedBox(height: 12,),
              TextFields(
                  controller: numberController,
                  hintText: '0812-5678-9010',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('Alamat'),
              SizedBox(height: 12,),
              TextFields(
                  controller: alamatController,
                  hintText: 'Malang',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('Universitas'),
              SizedBox(height: 12,),
              TextFields(
                  controller: universitasController,
                  hintText: 'Universitas Brawijaya',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 16,),
              Text('Jurusan'),
              SizedBox(height: 12,),
              TextFields(
                  controller: jurusanController,
                  hintText: 'Sistem Informasi',
                  obscureText: false,
                  color: Color(0XFFF1F3FF),
                  borderColor: Colors.transparent
              ),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}
