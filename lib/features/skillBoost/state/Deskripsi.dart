import 'package:flutter/material.dart';

class DeskripsiWidget extends StatefulWidget {
  const DeskripsiWidget({super.key});

  @override
  State<DeskripsiWidget> createState() => _DeskripsiWidgetState();
}

class _DeskripsiWidgetState extends State<DeskripsiWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deskripsi Materi'),
              Text('Video pembelajaran ini akan membahas dasar-dasar UX Design, '
                  'mulai dari konsep fundamental, Baca selengkapnya'),
              SizedBox(height: 40,),
              Container(
                width: 354,
                height: 64,
                decoration: BoxDecoration(
                  color: Color(0XFFA4E6FF),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
