import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();
  int index = 0;

  final List<Map<String, String?>> onboardingData = [
    {
      "title": "Skill Boost",
      "h1": "Interactive Learning, Real World Skills!",
      "h2": "Video Pembelajaran interaktif dan aplikatif yang telah disesuaikan "
          "dengan kebutuhan industri saat ini",
      "image": "assets/images/Onboarding_1.png",
      "dot": "assets/images/Dot_1.png"
    },
    {
      "title": "Skill Guidance",
      "h1": "Guidance Tailored\nJust for You",
      "h2": "Dapatkan mentoring 1-on-1 yang dipersonalisasi sesuai jurusan dan karier impian Anda.",
      "image": "assets/images/Onboarding_2.png",
      "dot": "assets/images/Dot_2.png"
    },
    {
      "title": "Skill Challenge",
      "h1": "Build. Solve.\nImpress!",
      "h2": "Kembangkan keterampilan, selesaikan tantangan nyata, dan buat portofolio yang mengesankan.",
      "image": "assets/images/Onboarding_3.png",
      "dot": "assets/images/Dot_3.png"
    },
    {
      "title": "ElevateU",
      "h1": "Siap Kerja, Siap \nSukses",
      "h2": null,
      "image": "assets/images/Onboarding_4.png",
      "dot": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 62),
          Row(
            children: [
              const SizedBox(width: 16),
              Opacity(
                opacity: index == 0 ? 0 : 1,
                child: IconButton(
                  onPressed: () {
                    if (index > 0) {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                    }
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/icons/Chevron_Left.png'),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 44),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int pageIndex) {
                setState(() {
                  index = pageIndex;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, pageIndex) {
                final data = onboardingData[pageIndex];
                if (index < 3) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 61, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                data['title']!,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFFBBC05),
                                ),
                            ),
                            const SizedBox(height: 9),
                            Text(
                              data['h1']!,
                              style: const TextStyle(
                                fontSize: 27,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF063CA0),
                              ),
                            ),
                            const SizedBox(height: 9),
                            if (data['h2'] != null)
                              Text(
                                data['h2']!,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF828282),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                      Image.asset(data['image']!),
                      const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 39),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (index < onboardingData.length - 1) {
                                  pageController.jumpToPage(onboardingData.length - 1);
                                }
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  color: Color(0XFF828282),
                                ),
                              ),
                            ),
                            if (data['dot'] != null)
                              ImageIcon(
                                AssetImage(data['dot']!),
                                size: 42,
                              ),
                            TextButton(
                              onPressed: () {
                                if (index < onboardingData.length - 1) {
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                }
                              },
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  color: Color(0XFF828282),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(data['image']!),
                      const SizedBox(height: 37),
                      Text(
                        data['title']!,
                        style:
                        const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFFBBC05)
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Text(data['h1']!,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF193C68),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 70),
                      Container(
                        width: 326,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0XFF0D7CA4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'Mulai',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}