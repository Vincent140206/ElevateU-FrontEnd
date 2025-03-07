import 'package:flutter/material.dart';
import '../NavBar/homeScreen/lists/skillBoostList.dart';
import 'MateriSkillBoost.dart';
import 'Sertifikat.dart';
import 'Ulasan1.dart';
import 'Video.dart';

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

  // State variable to track the selected tab
  String _selectedTab = 'Deskripsi';

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
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedTab = 'Deskripsi';
                                      });
                                    },
                                    child: const Text('Deskripsi'),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedTab = 'Sertifikat';
                                      });
                                    },
                                    child: const Text('Sertifikat'),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedTab = 'Ulasan';
                                      });
                                    },
                                    child: const Text('Ulasan'),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const SizedBox(height: 20),
                              if (_selectedTab == 'Deskripsi') ...[
                                const Text(
                                  'Deskripsi Materi ',
                                  style: TextStyle(
                                    color: Color(0xFF141414),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 1.40,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Video pembelajaran ini akan membahas dasar-dasar UX Design, '
                                      'mulai dari konsep fundamental, Baca selengkapnya',
                                  style: TextStyle(
                                    color: Color(0xFF5B5B5B),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1.50,
                                  ),
                                ),
                              ] else if (_selectedTab == 'Sertifikat') ...[
                                const SertifikatWidget(),
                              ] else if (_selectedTab == 'Ulasan') ...[
                                const UlasanWidget1(),
                              ],
                              const SizedBox(height: 20),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: materiSB.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final materi = materiSB[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      width: double.maxFinite,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: materi.jenis == 'Video'
                                            ? const Color(0xFFA4E6FF)
                                            : const Color(0xFF1F80A2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: materi.jenis == 'Video'
                                          ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 12),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 28,
                                                  height: 28,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF30C8FF),
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      materi.id,
                                                      style: const TextStyle(color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      materi.title,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w600,
                                                        height: 1.40,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                        TextSpan(
                                                        text: '00.00 / ',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.40,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: materi.durasi,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.40,
                                                        ),
                                                      )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 28,
                                                  height: 28,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF30C8FF),
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  child: const Icon(
                                                    Icons.play_arrow,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                          : Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 12),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/BukuPensil.png',
                                                  width: 40,
                                                  height: 38,
                                                ),
                                                const SizedBox(width: 8),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Catatan',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w600,
                                                        height: 1.40,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(materi.title),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  'assets/icons/Ceklis.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ],
                                            ),
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
          Positioned(
            top: 200,
            left: 150,
            right: 150,
            child: Opacity(
              opacity: _backButtonOpacity,
              child: GestureDetector(
                onTap: _isBackButtonEnabled ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SBVideo(sboost: widget.sboost)));
                } : null,
                child: Image.asset(
                  'assets/images/Play.png',
                  width: 76,
                  height: 76,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}