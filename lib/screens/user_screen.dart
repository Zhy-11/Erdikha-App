import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                // alignment: Alignment.bottomCenter,
                height: height * 0.28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/appbar-user.png"),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Achmad Ziyan Saputra",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(blurRadius: 10, spreadRadius: -6)
                          ]),
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Color(0xff80B3FF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: height * 0.08,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Color(0xff80B3FF),
                        ),
                      ),
                    ),
                    Text(
                      "Achmad Ziyan Saputra",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 25),
              SizedBox(
                height: height * 0.08,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Center(
                        child: Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                          color: Color(0xff80B3FF),
                        ),
                      ),
                    ),
                    Text(
                      "Date to join company",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 25),
              SizedBox(
                height: height * 0.08,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Center(
                        child: Icon(
                          Icons.phone_android,
                          size: 30,
                          color: Color(0xff80B3FF),
                        ),
                      ),
                    ),
                    Text(
                      "0821-1110-8527",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 25),
              SizedBox(
                height: height * 0.08,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                        color: Color(0xff80B3FF),
                      )),
                    ),
                    Text(
                      "@achmdzyn",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 25),
              SizedBox(
                height: height * 0.08,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Center(
                        child: Icon(
                          Icons.mail_outline_rounded,
                          size: 30,
                          color: Color(0xff80B3FF),
                        ),
                      ),
                    ),
                    Text(
                      "achmadziyan86@gmail.com",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 25),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "LOGOUT",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Apakah anda yakin ingin keluar dari aplikasi?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    height: height * 0.08,
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.2,
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              size: 30,
                              color: Color(0xff0071BC),
                            ),
                          ),
                        ),
                        Text(
                          "Keluar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0071BC),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
