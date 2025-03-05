import 'package:flutter/material.dart';

class UlasanWidget extends StatefulWidget {
  const UlasanWidget({super.key});

  @override
  State<UlasanWidget> createState() => _UlasanWidgetState();
}

class _UlasanWidgetState extends State<UlasanWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ulasan"),
    );
  }
}
