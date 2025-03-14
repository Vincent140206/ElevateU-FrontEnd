import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:elevateu_bcc_new/widgets/PopUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/NavBar/homeScreen/HomeScreen.dart';
import 'PremiumChoice.dart';

class PaymentConfirmation extends StatefulWidget {
  final PremiumChoice listPremium;
  const PaymentConfirmation({super.key, required this.listPremium});

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 20, right: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset(
                    'assets/icons/Chevron_Left.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 82),
                Text(
                  'Pembayaran',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF141414),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Payment.png',
                  width: 146,
                  height: 92,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.listPremium.title),
                    SizedBox(height: 8),
                    Text('Video Pembelajaran'),
                    SizedBox(height: 8),
                    Text(widget.listPremium.price),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rincian Pembayaran'),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 49,
                  padding: EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Color(0XFFE7F0FB),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFF4D86CD)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/Payment.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 8),
                      Text(widget.listPremium.title ),
                      Spacer(),
                      Text(widget.listPremium.price.split(' ').take(2).join(' '))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Harga'),
                    Spacer(),
                    Text(widget.listPremium.price.split(' ').take(2).join(' '))
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('Discount'),
                    Spacer(),
                    Text('Rp 0'),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text('Total'),
                    Spacer(),
                    Text(widget.listPremium.price.split(' ').take(2).join(' '))
                  ],
                ),
                SizedBox(height: 330),
                Elevatedbutton1(
                  tulisan: 'Bayar Sekarang',
                  onPressed: () {
                    PopUp.show(
                      context,
                      imagePath: 'assets/images/AkunCreated.png',
                      deskripsi: 'Pembayaran Anda Berhasil',
                    ).then((_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen(name: '',)),
                      );
                    });
                  },
                  width: double.infinity,
                  height: 48,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}