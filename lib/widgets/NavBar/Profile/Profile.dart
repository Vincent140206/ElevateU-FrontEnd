import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/features/auth/bloc/auth_event.dart';
import 'package:elevateu_bcc_new/features/auth/view/LoginScreen.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_bloc.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_event.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
              SizedBox(height: 44,),
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
                        String avatarUrl = userData?['avatarUrl'] ?? 'assets/images/Rafael.png';
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
                                    return Image.asset('assets/images/Rafael.png');
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
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is UserSuccess) {
                        PopUp.show(
                            context,
                            imagePath: 'assets/images/AkunCreated.png',
                            deskripsi: 'Berhasil Logout'
                        ).then((_) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen())
                          );
                        });
                      } else if (state is UserFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal Logout')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(LogoutSubmitted());
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
                            Icon(Icons.navigate_next_sharp,size: 30,)
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 34,),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is UserSuccess) {
                        PopUp.show(
                            context,
                            imagePath: 'assets/images/AkunCreated.png',
                            deskripsi: 'Akun berhasil dihapus'
                        ).then((_) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen())
                          );
                        });
                      } else if (state is UserFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Aksi gagal, coba lagi')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<UserBloc>(context).add(DeleteUserRequested());
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
                            Icon(Icons.navigate_next_sharp,size: 30,)
                          ],
                        ),
                      );
                    },
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
