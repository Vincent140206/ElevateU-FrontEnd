import 'package:dio/src/dio.dart';
import 'package:elevateu_bcc/Register/bloc/OTPBloc.dart';
import 'package:elevateu_bcc/Register/bloc/RegisterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/auth/SplashScreen.dart';

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