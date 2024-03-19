import 'package:flutter/material.dart';

class AboutAppCard extends StatelessWidget {
  const AboutAppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        // vertical: 170,
        vertical: MediaQuery.of(context).size.height * 0.18,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/masakankuLogo.png',
                width: 150,
              ),
              const Text(
                'Selamat Datang \ndi \nMasakanku!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Di sini, setiap halaman adalah kisah rasa yang tak terlupakan. Temukan kelezatan di setiap resep, cerita di balik setiap masakan, dan kreativitas di setiap hidangan. Aplikasi kami adalah dunia kuliner yang penuh inspirasi, di mana setiap sentuhan unik Anda menciptakan kisah rasa baru. Mari bersama-sama menjelajahi dunia cita rasa yang tak terbatas dan memberi hidup pada setiap masakan di meja Anda.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Semua gambar ilustrasi yang ada pada halaman onboarding merupakan aset dari Storyset.com',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(child: Image.asset('assets/tagline.png')),
        ],
      ),
    );
  }
}
