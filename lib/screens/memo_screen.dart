import 'package:erdhika/screens/memo/add_memo_screen.dart';
import 'package:erdhika/widgets/button_card_widget.dart';
import 'package:erdhika/widgets/button_main_widget.dart';
import 'package:erdhika/widgets/maintenance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight + kToolbarHeight),
      //   child: Container(
      //     color: Colors.lightBlue,
      //   ),
      // ),
      body: Container(
        color: Colors.white,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
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
                  "Memo",
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 35,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, top: 0, bottom: 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Cari",
                                border: OutlineInputBorder(
                                  // gapPadding: 0,
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return MaintenanceWidget();
                              },
                            );
                          },
                          child: Icon(
                            Icons.filter_list,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     ButtonMainWidget(
                  //       text: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 12),
                  //         child: Text(
                  //           "Add New",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 14,
                  //             fontFamily: 'Inter',
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ),
                  //       backgroundColor: Color(0xFF0066FF),
                  //     ),
                  //   ],
                  // ),
                  GridView(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    children: [
                      ButtonCardWidget(
                        backgroundColor: Color(0x4C4997C3),
                        iconColor: Color(0xff0066FF),
                        text: "Create New",
                        ontap: () => Get.to(() => AddMemoScreen()),
                      ),
                      ButtonCardWidget(
                        backgroundColor: Color(0x4C53FF28),
                        iconColor: Color(0xff8FFF7D),
                        text: "Export",
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return MaintenanceWidget();
                            },
                          );
                        },
                      ),
                      ButtonCardWidget(
                        backgroundColor: Color(0x4CF9C303),
                        iconColor: Color(0xffFFC633),
                        text: "Print",
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return MaintenanceWidget();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(left: 20, bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: -2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MaintenanceWidget();
                                      },
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  // splashRadius: 5,
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MaintenanceWidget();
                                      },
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  // splashRadius: 5,
                                  icon: Icon(Icons.delete_outline_rounded),
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Kepada : ",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Nama",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                text: "Pengirim : ",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Nama Divisi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                text: "Perihal : ",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Tentang Perihal",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                text: "Tanggal : ",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: "02-11-2023",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
