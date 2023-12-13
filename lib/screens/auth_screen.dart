import 'package:erdhika/screens/login_screen.dart';
import 'package:erdhika/screens/register_screen.dart';
import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Container(
        width: width,
        padding: EdgeInsets.fromLTRB(23, height * 0.21, 23, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              // Color(0xFF252626),
              Color(0xFF80B3FF),
              // Color(0xFF769FCD),
              Color(0xFFA2C8F2),
              Color(0xFFB9D7EA),
              Color(0xFFA2C8F2),
              // Color(0xFFA2C8F2),
              // Color(0xFF98C2F5),
              Color(0xFF80B3FF),
              Color(0xFF80B3FF),
              Color(0xFF80B3FF),
              Color(0xFF80B3FF),
              Color(0xFF80B3FF),
              // Color(0xFFEEEEEE)
            ],
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              scale: 5,
            ),
            SizedBox(height: 50),
            ButtonMainWidget(
              text: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Colors.white,
              onTap: () => Get.to(() => LoginScreen()),
            ),
            SizedBox(height: 18),
            ButtonMainWidget(
              text: Text(
                'Register Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Colors.transparent,
              border: Border.all(color: Colors.white),
              onTap: () => Get.to(() => RegisterScreen()),
            ),
            SizedBox(height: 58),
            Text(
              "Quick login with Touch ID",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Image.asset(
              "assets/images/fingerprint.png",
              scale: 3,
            ),
            SizedBox(height: 18),
            Text(
              "Use Touch ID",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
