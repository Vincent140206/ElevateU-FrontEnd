import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../NavBar/homeScreen/lists/skillBoostList.dart';
import 'Deskripsi.dart';

class SkillBoostScreen extends StatefulWidget {
  final sbList sboost;

  const SkillBoostScreen({
    super.key,
    required this.sboost,
  });

  @override
  State<SkillBoostScreen> createState() => _SkillBoostScreenState();
}

class _SkillBoostScreenState extends State<SkillBoostScreen> {
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
            height: 472,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.sboost.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              margin: const EdgeInsets.only(top: 450),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.sboost.title,
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Text('Roseanne Park, UX Designer'),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Bintang_Riview.png',
                                    width: 96,
                                    height: 14,
                                  ),
                                  const SizedBox(width: 9),
                                  Text(widget.sboost.review),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Course.png',
                                    width: 19,
                                    height: 19,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(widget.sboost.materi),
                                  const SizedBox(width: 34),
                                  Image.asset(
                                    'assets/images/Murid.png',
                                    width: 20,
                                    height: 14,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text('345 Murid'),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  TextButton(
                                    onPressed: (){
                                      DeskripsiWidget();
                                    },
                                    child: Text(
                                        'Deskripsi'
                                    ),
                                  ),
                                  Spacer(),
                                  TextButton(
                                    onPressed: (){

                                    },
                                    child: Text(
                                        'Sertifikat'
                                    ),
                                  ),
                                  Spacer(),
                                  TextButton(
                                    onPressed: (){

                                    },
                                    child: Text(
                                        'Ulasan'
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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