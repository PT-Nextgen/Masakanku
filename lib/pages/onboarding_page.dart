import 'package:flutter/material.dart';
import 'package:masakanku/pages/home_page.dart';
import 'package:masakanku/widgets/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              OnboardingScreen(
                image: 'assets/onboarding1.png',
                title: 'Selamat Datang di \nPenjelajahan Kuliner',
                description:
                    'Selamat datang di Masakanku! Temukan resep-resep lezat, kiat memasak, dan cerita di balik setiap hidangan. Mulailah petualangan masak Anda yang tak terlupakan.',
              ),
              OnboardingScreen(
                image: 'assets/onboarding2.png',
                title: 'Jelajahi Cita Rasa \nDunia',
                description:
                    'Eksplorasi berbagai cita rasa dunia di ujung jari Anda. Dari masakan tradisional hingga inovasi kreatif, mari jelajahi keanekaragaman kuliner yang menggugah selera.',
              ),
              OnboardingScreen(
                image: 'assets/onboarding3.png',
                title: 'Kuasai Seni \nMemasak',
                description:
                    'Kuasai seni memasak dengan resep kami yang teruji. Dapatkan panduan langkah demi langkah, dan inspirasi untuk meningkatkan keterampilan memasak Anda.',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.55),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(activeDotColor: Colors.red.shade400),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.80),
            margin: const EdgeInsets.symmetric(
              horizontal: 26,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(2);
                  },
                  child: const Text('Lewati'),
                ),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );

                      if (onLastPage == true) {
                        await prefs.setInt("initScreen", 1);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const HomePage(
                                  url: 'https://masakanku.my.id/'),
                            ),
                            (route) => false);
                      }
                    },
                    child: onLastPage
                        ? const Text('Mulai')
                        : const Text('Selanjutnya'),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //
                //   },
                //   child: onLastPage ? const Text('Done') : const Text('Next'),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
