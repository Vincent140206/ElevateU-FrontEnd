import 'package:dio/src/dio.dart';
import 'package:elevateu_bcc_new/core/services/category_services.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/core/services/user_services.dart';
import 'package:elevateu_bcc_new/features/auth/bloc/auth_bloc.dart';
import 'package:elevateu_bcc_new/features/category/bloc/category_bloc.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/bloc/LoginBloc.dart';
import 'features/auth/bloc/OtpBloc.dart';
import 'features/auth/bloc/RegisterBloc.dart';
import 'features/auth/view/SplashScreen.dart';
import 'package:elevateu_bcc_new/core/services/api.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserServices userServices = UserServices();
  LocalStorageService localStorageService = LocalStorageService();
  Api api = await Api.create();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<OTPBloc>(
          create: (context) => OTPBloc(Dio()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(Dio()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(Dio()),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(Dio(), userServices),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(Dio(), localStorageService),
        ),
        BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(Dio(), CategoryServices()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}