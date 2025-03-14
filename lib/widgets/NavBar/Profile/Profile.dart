import 'package:elevateu_bcc_new/admin.dart';
import 'package:elevateu_bcc_new/admin/mentor.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/features/auth/bloc/auth_event.dart';
import 'package:elevateu_bcc_new/features/auth/view/LoginScreen.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_bloc.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/auth/bloc/auth_bloc.dart';
import '../../../features/auth/bloc/auth_state.dart';
import '../../PopUp.dart';
import 'EditProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LocalStorageService localStorageService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 44,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Center(
                  child: Text('Profil'),
                ),
              ),
              Row(
                children: [
                  FutureBuilder<Map<String, String?>>(
                    future: localStorageService.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final userData = snapshot.data;
                        String avatarUrl = userData?['avatar_url'] ??
                            'assets/images/Rafael.png';
                        return Row(
                          children: [
                            Container(
                              width: 67,
                              height: 67,
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
                            ),
                            SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userData?['name'] ?? 'No Name'),
                                Text(userData?['email'] ?? 'No Email'),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 63,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
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
                        Icon(
                          Icons.navigate_next_sharp,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
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
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
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
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
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
                        )),
                      ),
                      const SizedBox(width: 20),
                      Text('Bantuan'),
                      Spacer(),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Divider(),
                  SizedBox(
                    height: 27,
                  ),
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
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
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
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        PopUp.show(
                          context,
                          imagePath: 'assets/images/AkunCreated.png',
                          deskripsi: 'Berhasil Logout',
                        ).then((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        });
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal Logout')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Konfirmasi Logout'),
                                content: const Text(
                                    'Apakah Anda yakin ingin logout?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      BlocProvider.of<AuthBloc>(context)
                                          .add(LogoutSubmitted());
                                    },
                                    child: const Text('Logout'),
                                  ),
                                ],
                              );
                            },
                          );
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
                                  Icons.exit_to_app_outlined,
                                  size: 19,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text('Keluar'),
                            Spacer(),
                            Icon(Icons.navigate_next_sharp, size: 30),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi Hapus Akun'),
                            content: const Text(
                                'Apakah Anda yakin ingin menghapus akun ini?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  BlocProvider.of<UserBloc>(context)
                                      .add(DeleteUserRequested());
                                },
                                child: const Text('Hapus'),
                              ),
                            ],
                          );
                        },
                      );
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
                              Icons.delete_forever,
                              size: 19,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text('Delete Account'),
                        Spacer(),
                        Icon(Icons.navigate_next_sharp, size: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()));
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
                              Icons.info_outline,
                              size: 19,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text('Admin'),
                        Spacer(),
                        Icon(
                          Icons.navigate_next_sharp,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
