import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/material.dart';

class SertifikatWidget extends StatefulWidget {
  const SertifikatWidget({super.key});

  @override
  State<SertifikatWidget> createState() => _SertifikatWidgetState();
}

class _SertifikatWidgetState extends State<SertifikatWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Image.asset('assets/images/Sertifikat.png'),
            SizedBox(height: 45,),
            Elevatedbutton1(
                tulisan: 'Unduh Sertifikat',
                onPressed: () {

                },
                width: double.maxFinite,
                height: 48
            )
          ],
        ),
      ),
    );
  }
}
