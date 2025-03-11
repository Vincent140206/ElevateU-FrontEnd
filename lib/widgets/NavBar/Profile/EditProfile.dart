import 'dart:io';
import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../features/user/bloc/user_bloc.dart';
import '../../../features/user/bloc/user_event.dart';
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
  final TextEditingController universitasController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  LocalStorageService localStorageService = LocalStorageService();
  String role = '';
  File? image;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      Map<String, String?> userData = await localStorageService.getUserData();
      setState(() {
        nameController.text = userData['name'] ?? '';
        emailController.text = userData['email'] ?? '';
        role = userData['role'] ?? '';
        passwordController.text = userData['password'] ?? '';
        numberController.text = userData['number'] ?? '';
        universitasController.text = userData['student_instance'] ?? '';
        jurusanController.text = userData['student_major'] ?? '';
      });
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      debugPrint('No image selected.');
    }
  }

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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            'assets/icons/Chevron_Left.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    child: Center(
                      child: image == null
                          ? Image.asset(
                        'assets/images/Rafael.png',
                        width: 87,
                        height: 87,
                      )
                          : ClipOval(
                        child: Image.file(
                          image!,
                          width: 87,
                          height: 87,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 170,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            pickImage();
                          },
                          icon: Image.asset(
                            'assets/images/Kamera.png',
                            width: 30,
                            height: 28,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0XFFF1F3FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(role),
                ),
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
              SizedBox(height: 50,),
              Elevatedbutton1(
                  tulisan: 'Simpan Profile',
                  onPressed: () {
                    String name = nameController.text;
                    String email = emailController.text;
                    String role = roleController.text;
                    String universitas = universitasController.text;
                    String jurusan = jurusanController.text;

                    context.read<UserBloc>().add(PatchUserRequested(
                      name: name,
                      email: email,
                      role: role,
                      universitas: universitas,
                      jurusan: jurusan,
                    ));

                    if (image != null) {
                    context.read<UserBloc>().add(UpdateAvatarRequested(image!));
                    }
                  },
                  width: double.infinity,
                  height: 48
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}