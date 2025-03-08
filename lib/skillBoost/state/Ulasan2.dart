import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/material.dart';

class UlasanWidget2 extends StatefulWidget {
  const UlasanWidget2({super.key});

  @override
  State<UlasanWidget2> createState() => _UlasanWidgetState();
}

class _UlasanWidgetState extends State<UlasanWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text('Fundamental UX Designer'),
              SizedBox(height: 8,),
              Text('Roseanne Park, UX Designer'),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 10,),
              Center(
                child: Column(
                  children: [
                    Text('Rating Kursus Ini'),
                    SizedBox(height: 5,),
                    Image.asset(
                        'assets/images/Bintang_Riview.png',
                      width: 246,
                      height: 36,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 44,),
              Text('Tambahkan detail ulasan'),
              SizedBox(height: 5,),
              Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tulis ulasan Anda disini'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200,),
              Elevatedbutton1(
                  tulisan: "Submit",
                  onPressed: () {

                  },
                  width: double.maxFinite,
                  height: 48
              ),
            ],
          ),
        ),
      )
    );
  }
}
