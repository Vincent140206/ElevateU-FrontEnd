import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Payment.dart';
import 'PremiumChoice.dart';

class PremiumList extends StatefulWidget {
  const PremiumList({super.key});

  @override
  State<PremiumList> createState() => _PremiumListState();
}

class _PremiumListState extends State<PremiumList> {
  late ScrollController _scrollController;
  double _backButtonOpacity = 1.0;
  bool _isBackButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      if (offset >= 100 && _isBackButtonEnabled) {
        setState(() {
          _backButtonOpacity = 0.0;
          _isBackButtonEnabled = false;
        });
      } else if (offset < 100 && !_isBackButtonEnabled) {
        setState(() {
          _backButtonOpacity = 1.0;
          _isBackButtonEnabled = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Premium3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 350),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Container(
                            width: 95,
                            height: 7,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D7CA4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Belajar tanpa batas, Coba ElevateU premium ',
                                    style: TextStyle(
                                      color: Color(0xFF141414),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'untuk pengalaman belajar lebih baik',
                                      style: TextStyle(
                                        color: Color(0xFF5B5B5B),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: pilihanPremium(context).length,
                              itemBuilder: (context, index) {
                                final listPremium = pilihanPremium(context)[index];
                                return InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(20),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Payment.png',
                                                      width: double.maxFinite,
                                                      height: 129,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Positioned(
                                                        child: Image.asset(
                                                          'assets/images/Premium4.png',
                                                          height: 129,
                                                          width: double.maxFinite,
                                                          fit: BoxFit.cover
                                                        ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                              Positioned(
                                                top: 50,
                                                bottom: 50,
                                                left: 30,
                                                child: Text(
                                                  listPremium.title,
                                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                                ),
                                              ),
                                              Positioned(
                                                top: 70,
                                                bottom: 30,
                                                left: 30,
                                                child: Text(
                                                  listPremium.price,
                                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    listPremium.description,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(height: 20,),
                                                Elevatedbutton1(
                                                    tulisan: "Dapatkan Premium Individual",
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentConfirmation(listPremium: listPremium,)));
                                                    },
                                                    width: double.infinity,
                                                    height: 48
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Opacity(
              opacity: _backButtonOpacity,
              child: IconButton(
                onPressed: _isBackButtonEnabled ? () => Navigator.of(context).pop() : null,
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}