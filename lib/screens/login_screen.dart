import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:erdhika/screens/forgot_password_screen.dart';
import 'package:erdhika/screens/navigation_screen.dart';
import 'package:erdhika/screens/register_screen.dart';
import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  num angka = 0;

  Future<void> login(String email, String password) async {
    final apiUrl = 'http://10.10.10.187:8080/api/login';

      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      //mengambil data token
      final token = json.decode(response.body)['access_token'];

      //mengabil data user

      //menyimpan data token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      //berpindah halaman
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          
        ),
        (route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          isAntiAlias: true,
          image: AssetImage("assets/images/bgauth.png"),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            AppBar(
              leadingWidth: 80,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: ListView(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    // bottom: 30,
                  ),
                  physics: BouncingScrollPhysics(),
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.1),
                    Center(child: Image.asset("assets/images/logo.png", scale: 5)),
                    SizedBox(height: 35),
                    Text(
                      "Email id",
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: emailCtrl,
                      // onTapOutside: (event) =>
                      //     FocusManager.instance.primaryFocus?.unfocus(),
                      validator: (value) =>
                          (value != null && !EmailValidator.validate(value)) ? "This Field is Required and include an '@'" : null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x7F4B4B4B))),
                        contentPadding: EdgeInsets.only(
                          bottom: 0,
                          top: 0,
                          left: 10,
                          right: 10,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Password",
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: passwordCtrl,
                      // onTapOutside: (event) =>
                      //     FocusManager.instance.primaryFocus?.unfocus(),
                      obscureText: true,
                      validator: (value) => value!.isEmpty ? "This Field is Required" : null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0x7F4B4B4B))),
                        contentPadding: EdgeInsets.only(
                          bottom: 0,
                          top: 0,
                          left: 10,
                          right: 10,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ButtonMainWidget(
                      onTap: () {
                        login(emailCtrl.text, passwordCtrl.text);
                      },
                      text: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color(0xFF80B3FF),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.to(() => ForgotPasswordScreen()),
                        child: Text(
                          "Forgot Password ?",
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 43),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "or",
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(width: 43),
                      ],
                    ),
                    SizedBox(height: 30),
                    ButtonMainWidget(

                      backgroundColor: Colors.white,
                      borderRadius: 50,
                      border: Border.all(color: Color(0xFF80B3FF), width: 2),
                      text: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon-google.png",
                            scale: 3,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Masuk dengan Google",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // InkWell(
                    //   onTap: () => Navigator.pop(context),
                    //   child: Row(
                    //     children: [
                    //       Ink(
                    //         decoration: BoxDecoration(
                    //           color: Color(0xff3a559f),
                    //           borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(2),
                    //             bottomLeft: Radius.circular(2),
                    //           ),
                    //         ),
                    //         width: 36,
                    //         height: 36,
                    //         child: Center(
                    //           child: FaIcon(
                    //             FontAwesomeIcons.facebookF,
                    //             color: Colors.white,
                    //             size: 16,
                    //           ),
                    //         ),
                    //       ),
                    // Expanded(
                    //   child: Ink(
                    //     width: double.maxFinite,
                    //     height: 36,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xFF2D4497),
                    //       borderRadius: BorderRadius.only(
                    //         topRight: Radius.circular(2),
                    //         bottomRight: Radius.circular(2),
                    //       ),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         "Login with Facebook",
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //     ],
                    //   ),
                    // ),
                    // Spacer(),
                    // Row(ch)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ? ",
                          ),
                          GestureDetector(
                            onTap: () => Get.off(() => RegisterScreen()),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Color(0xFF4C94FF),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaintTopRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff92bbff),
          Color(0xFF6ca0ec),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width, size.height / 8),
          radius: 100,
        ),
      )
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 1.9, 0);
    path.cubicTo(size.width / 2.7, size.height / 9, size.width / 2.1, size.height / 7, size.width / 1.6, size.height / 6);
    path.cubicTo(size.width / 1.1, size.height / 5, size.width / 1.24, size.height / 3, size.width, size.height / 3.1);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
