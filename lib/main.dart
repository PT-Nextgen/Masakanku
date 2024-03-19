import 'package:flutter/material.dart';
import 'package:masakanku/pages/home_page.dart';
// import 'package:masakanku/pages/home_page.dart';
import 'package:masakanku/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  debugPrint('initScreen $initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masakanku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: initScreen == 1
          ? const HomePage(url: 'https://masakanku.my.id/')
          : const OnboardingPage(),
      // const HomePage(url: 'https://masakanku.my.id/'),
    );
  }
}
