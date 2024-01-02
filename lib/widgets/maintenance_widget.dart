import 'package:flutter/material.dart';

class MaintenanceWidget extends StatelessWidget {
  const MaintenanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // alignment: Alignment.center,
      // content: Text(
      //   "Coming Soon",
      //   textAlign: TextAlign.center,
      //   style: TextStyle(fontFamily: "Poppins"),
      // ),
      title: Text(
        "Coming Soon",
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "Poppins"),
      ),
    );
  }
}
