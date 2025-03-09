import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/bloc/LoginBloc.dart';
import 'features/auth/bloc/OtpBloc.dart';
import 'features/auth/bloc/RegisterBloc.dart';
import 'features/auth/view/SplashScreen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<OTPBloc>(
          create: (context) => OTPBloc(Dio()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(Dio())
        ),
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(Dio())
        ),
      ],
      child: MyApp(),
    )
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