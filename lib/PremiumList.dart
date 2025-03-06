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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
            height: 472,
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
              Container(
                margin: const EdgeInsets.only(top: 450),
                color: Colors.white,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  color: Colors.white,
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
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              title: Text(listPremium.title),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listPremium.description),
                                  SizedBox(height: 4),
                                  Text(listPremium.price),
                                ],
                              ),
                              trailing: listPremium.button,
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
        ],
      ),
    );
  }
}