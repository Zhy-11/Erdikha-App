import 'package:email_validator/email_validator.dart';
import 'package:erdhika/screens/login_screen.dart';
import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: PaintTopRight(),
          ),
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
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.2),
                  Center(
                      child: Image.asset("assets/images/logo.png", scale: 5)),
                  SizedBox(height: 55),
                  // Text(
                  //   "Email id",
                  // ),
                  Text("Enter your email address registered. You will receive an email with a link to reset your password."),
                  SizedBox(height: 29),
                  TextFormField(
                    controller: emailCtrl,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    validator: (value) =>
                        (value != null && !EmailValidator.validate(value))
                            ? "This Field is Required and include an '@'"
                            : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "example@gmail.com",
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
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF80B3FF),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
