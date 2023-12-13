import 'package:email_validator/email_validator.dart';
import 'package:erdhika/screens/login_screen.dart';
import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  ScrollController scrollController = ScrollController();
  // bool tapTextfield = false;
  // bool tapPassword = false;

  _onStartScroll(ScrollMetrics metrics) {
    print("Scroll Start");
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    print("Scroll Update");
  }

  _onEndScroll(ScrollMetrics metrics) {
    print("Scroll End");
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
        // extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor:  Colors.transparent,
          elevation: 0,
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
        ),
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                _onStartScroll(notification.metrics);
              } else if (notification is ScrollUpdateNotification) {
                _onUpdateScroll(notification.metrics);
              } else if (notification is ScrollEndNotification) {
                _onEndScroll(notification.metrics);
              }
              return true;
            },
            child: SingleChildScrollView(
              // controller: scrollController,
              // physics: NeverScrollableScrollPhysics(),
              // reverse: true,
              padding: EdgeInsets.fromLTRB(23, height * 0.1, 23, 0),
              child: Column(
                // shrinkWrap: true,
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.1),
                  Center(
                      child: Image.asset("assets/images/logo.png", scale: 5)),
                  SizedBox(height: 30),
                  Text(
                    "Username",
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: usernameCtrl,
                    // onTapOutside: (event) =>
                    //     FocusManager.instance.primaryFocus?.unfocus(),
                    validator: (value) =>
                        (value != null && !EmailValidator.validate(value))
                            ? "This Field is Required and include an '@'"
                            : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x7F4B4B4B))),
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
                    "Email id",
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: emailCtrl,
                    // onTapOutside: (event) =>
                    //     FocusManager.instance.primaryFocus?.unfocus(),
                    // onTap: () {
                    //   setState(() {
                    //     if (tapTextfield == false) {
                    //       tapTextfield = !tapTextfield;
                    //       return null;
                    //     }
                    //   });
                    // },
                    validator: (value) =>
                        (value != null && !EmailValidator.validate(value))
                            ? "This Field is Required and include an '@'"
                            : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x7F4B4B4B))),
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
                    // onTap: () {
                    //   setState(() {
                    //     tapPassword = !tapPassword;
                    //   });
                    // },
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? "This Field is Required" : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x7F4B4B4B))),
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
                    text: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF80B3FF),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ? ",
                      ),
                      GestureDetector(
                        onTap: () => Get.off(() => LoginScreen()),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFF4C94FF),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       bottom: MediaQuery.of(context).viewInsets.bottom),
                  // ),
                  // SizedBox(height: height * 0.16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
