import 'dart:html';

import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:erdhika/widgets/input_select_widget.dart';
import 'package:erdhika/widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMemoScreen extends StatefulWidget {
  const AddMemoScreen({super.key});

  @override
  State<AddMemoScreen> createState() => _AddMemoScreenState();
}

class _AddMemoScreenState extends State<AddMemoScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                // height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/appbar-memo.png"),
                  ),
                ),
                child: AppBar(
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  titleSpacing: 0,
                  title: Text(
                    "Add Memo",
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    style: widget  StyleEleme 
                    // Text(
                    //   "Kepada",
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 18,
                    //     fontFamily: 'Inter',
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    InputSelectWidget(
                      value: "Nama",
                      title: "Kepada",
                      suffix: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                    SizedBox(height: 14),
                    InputSelectWidget(
                      value: "Nama Divisi",
                      title: "Divisi",
                      suffix: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                    SizedBox(height: 14),
                    InputTextWidget(
                      title: "Perihal",
                      hintText: "Tentang Perihal",
                    ),
                    SizedBox(height: 14),
                    InputTextWidget(
                      title: "Isi",
                      hintText: "Isi Memo",
                      maxLines: 6,
                    ),
                    SizedBox(height: 14),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tanda Tangan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "User",
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.6000000238418579),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    ButtonMainWidget(
                      text: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Color(0xFF0066FF),
                    ),
                    SizedBox(height: 8),
                    ButtonMainWidget(
                      text: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Color(0xFFd9d9d9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
