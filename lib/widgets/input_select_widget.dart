import 'package:flutter/material.dart';

class InputSelectWidget extends StatelessWidget {
  InputSelectWidget({
    super.key,
    this.prefix,
    this.suffix,
    required this.value,
    required this.title,
    this.onTap,
    // this.iconMandatory = false,
    // this.onChanged,
    this.isEnable = true,
  });

  Widget? prefix;
  Widget? suffix;
  String value;
  String title;
  Function()? onTap;
  bool isEnable;
  // bool iconMandatory;
  // Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),
            decoration: BoxDecoration(
              // color: Color(0xffd6d6d6),
              // color:LightColors.disableTextField,
              border: Border.all(color: Color(0xffa8a8a8)),
              borderRadius: BorderRadius.circular(4),
            ),
            width: width,
            child: Container(
              // color: LightColors.green,
              height: 24,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: prefix != null ? 5 : 0),
                    child: prefix ?? SizedBox.shrink(),
                  ),
                  Expanded(
                    child: Container(
                      // color: LightColors.red,
                      // padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  suffix ?? SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
