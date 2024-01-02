import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  bool isAllRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff80B3FF),
        centerTitle: true,
        title: Text(
          "Notifikasi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(22),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    "Notifikasi",
                    style: TextStyle(
                      color: Color(0xFF0A0909),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.08,
                    ),
                  ),
                ),
                if (!isAllRead) ...[
                  ButtonMainWidget(
                    borderRadius: 50,
                    backgroundColor: Color(0xFF0066FF),
                    text: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "sudah dibaca",
                        style: TextStyle(
                          color: Color(0xFFFFFCFC),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isAllRead = true;
                      });
                    },
                  ),
                ]
              ],
            ),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.asterisk,
                            size: 18,
                            color: isAllRead ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengkinian berhasil di input",
                                style: TextStyle(
                                  color: Color(0xFF0A0909),
                                  // fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 14),
                              Text(
                                "Kamis, 90.00",
                                style: TextStyle(
                                  color: Color(0xFFB5ACAA),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Color(0xFFB5ACAA),
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
