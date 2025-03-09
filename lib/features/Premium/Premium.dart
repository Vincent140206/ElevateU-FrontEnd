import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/NavBar/homeScreen/HomeScreen.dart';
import 'PremiumList.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            SizedBox(
              height: 1000,
            ),
            Image.asset('assets/images/Premium.png'),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/Premium2.png',
                width: 515,
              ),
            ),
            Positioned(
              top: 360,
              left: 78.5,
                right: 78.5,
                child: Image.asset(
                    'assets/icons/Logo_1-Transparent.png',
                  width: 236,
                  height: 190,
                ),
            ),
            Positioned(
              top: 550,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Siapkan diri untuk meraih karier impianmu dengan Platform persiapan karir terbaik!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 690,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Elevatedbutton1(
                    tulisan: 'Coba Premium Sekarang',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumList()));
                    },
                    width: double.infinity,
                    height: 48
                ),
              ),
            ),
            Positioned(
              top: 760,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black, side: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),

                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('Coba Gratis'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}