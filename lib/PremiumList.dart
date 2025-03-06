import 'package:elevateu_bcc_new/NavBar/homeScreen/HomeScreen.dart';
import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                            SizedBox(height: 20),
                            Text('Belajar tanpa batas, Coba ElevateU Premium'),
                            SizedBox(height: 4),
                            Text('Untuk pengalaman belajar lebih baik'),
                            SizedBox(height: 8),
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
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                              child: Image.asset(
                                                'assets/images/Payment.png',
                                                width: 380,
                                                height: 131,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(

                                              child: Image.asset('assets/images/Premium4.png')
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

                                      ],
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