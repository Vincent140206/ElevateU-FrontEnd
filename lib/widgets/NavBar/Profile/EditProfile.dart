import 'dart:io';
import 'package:elevateu_bcc_new/core/services/user_services.dart';
import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../features/user/bloc/user_bloc.dart';
import '../../../features/user/bloc/user_event.dart';
import '../../../features/user/bloc/user_state.dart';
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
  String? imageUrl; // URL for the profile image
  UserServices userServices = UserServices();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      Map<String, String?> userData = await localStorageService.getUserData();
      imageUrl = await localStorageService.getUserProfileImageUrl();

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

  void _showAvatarOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Aksi'),
          content: Text('Apa yang ingin Anda lakukan?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<UserBloc>().add(DeleteAvatarRequested());
              },
              child: Text('Hapus Avatar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                userServices.pickImageAndUpdateAvatar(
                  context,
                  (imageUrl) {
                    context
                        .read<UserBloc>()
                        .add(UserAvatarUpdated(imageUrl) as UserEvent);
                    localStorageService.saveUserProfileImageUrl(imageUrl);
                    setState(() {
                      this.imageUrl = imageUrl;
                      loadUserData();
                    });
                    loadUserData();
                  },
                  (error) {
                    context
                        .read<UserBloc>()
                        .add(UserFailure(error) as UserEvent);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error)),
                    );
                  },
                );
              },
              child: Text('Upload Avatar'),
            ),
          ],
        );
      },
    );
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
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile updated successfully!')),
            );
          } else if (state is UserAvatarUpdated) {
            String newImageUrl = state.imageUrl;
            localStorageService.saveUserProfileImageUrl(newImageUrl);
            setState(() {
              imageUrl = newImageUrl;
            });
          } else if (state is UserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Aksi gagal, coba lagi')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        FutureBuilder<Map<String, String?>>(
                          future: localStorageService.getUserData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              final userData = snapshot.data;
                              String avatarUrl = userData?['avatar_url'] ??
                                  'assets/images/Rafael.png';
                              return Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    avatarUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/Rafael.png');
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Positioned(
                          top: 75,
                          left: 65,
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
                                  _showAvatarOptionsDialog(context);
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
                        ),
                      ],
                    ),
                  ),
                  Text('Nama'),
                  SizedBox(height: 12),
                  TextFields(
                    enabled: true,
                    controller: nameController,
                    hintText: 'Rafael Jacob Hansen',
                    obscureText: false,
                    color: Color(0XFFF1F3FF),
                    borderColor: Colors.transparent,
                  ),
                  SizedBox(height: 16),
                  Text('Email'),
                  SizedBox(height: 12),
                  TextFields(
                    controller: emailController,
                    hintText: 'user@example.com',
                    obscureText: false,
                    color: Color(0XFFF1F3FF),
                    borderColor: Colors.transparent,
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  Text('Role'),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0XFFF1F3FF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Text(role),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Kata Sandi'),
                  SizedBox(height: 12),
                  TextFields(
                    enabled: true,
                    controller: passwordController,
                    hintText: '*******',
                    obscureText: true,
                    color: Color(0XFFF1F3FF),
                    borderColor: Colors.transparent,
                  ),
                  SizedBox(height: 16),
                  Text('Universitas'),
                  SizedBox(height: 12),
                  TextFields(
                    enabled: true,
                    controller: universitasController,
                    hintText: 'Universitas Brawijaya',
                    obscureText: false,
                    color: Color(0XFFF1F3FF),
                    borderColor: Colors.transparent,
                  ),
                  SizedBox(height: 16),
                  Text('Jurusan'),
                  SizedBox(height: 12),
                  TextFields(
                    enabled: true,
                    controller: jurusanController,
                    hintText: 'Sistem Informasi',
                    obscureText: false,
                    color: Color(0XFFF1F3FF),
                    borderColor: Colors.transparent,
                  ),
                  SizedBox(height: 50),
                  Elevatedbutton1(
                    tulisan: 'Simpan Profile',
                    onPressed: () {
                      String name = nameController.text;
                      String email = emailController.text;
                      String universitas = universitasController.text;
                      String jurusan = jurusanController.text;

                      context.read<UserBloc>().add(PatchUserRequested(
                            name: name,
                            email: email,
                            role: role,
                            universitas: universitas,
                            jurusan: jurusan,
                            password: '',
                          ));
                    },
                    width: double.infinity,
                    height: 48,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
