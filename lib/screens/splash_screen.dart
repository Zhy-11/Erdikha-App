import 'dart:async';

import 'package:erdhika/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      Get.offAll(() => OnboardingScreen());
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        padding: EdgeInsets.all(22),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo2.png",
                  scale: 3,
                ),
                Text(
                  "sekuritas",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "PT. Erdikha Elit Sekuritas terdaftar dan diawasi oleh Otoritas Jasa Keuangan (OJK)",
                    // style: TextStyle(fontSize: 15),
                  ),
                ),
                Image.asset(
                  "assets/images/ojk.png",
                  scale: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
