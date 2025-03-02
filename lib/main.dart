import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/RegisterBloc.dart';
import 'screens/auth/SplashScreen.dart';

void main() {
  runApp(
    Provider<RegisterBloc>(
      create: (_) => RegisterBloc(Dio()),
      child: const MyApp(),
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