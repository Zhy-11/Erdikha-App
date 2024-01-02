import 'package:flutter/material.dart';

class ButtonCardWidget extends StatelessWidget {
  const ButtonCardWidget({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.text,
    this.ontap,
  });

  final Color backgroundColor;
  final Color iconColor;
  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // width: width * 0.3,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          // color: Color(0x4CF9C303),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: iconColor,
              // foregroundColor: Color(0xffFFC633),
              child: Icon(Icons.print),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Color(0xFF212D30),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}