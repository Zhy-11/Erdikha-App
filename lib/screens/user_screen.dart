import 'package:erdhika/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  // UserScreen({super.key, required this.id, required this.name, required this.email, required this.token});

  late final int id;
  late final String name;
  late final String email;
  late final String token;

  // UserScreen({required this.id, required this.name, required this.email, required this.token});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future<void> handleLogout(String token) async {
    final url = 'http://10.10.10.187:8080/api/logout';
    final headers = {
      'Authorization': 'Bearer ${this.widget.token}',
      'Content-Type': 'application/json',
    };

    final response = await http.post(Uri.parse(url), headers: headers);

    print(response.body);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

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
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: -6)]),
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
                        GestureDetector(
                          onTap: () {
                            handleLogout(this.widget.token);
                          },
                          child: Text(
                            "Keluar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0071BC),
                            ),
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
