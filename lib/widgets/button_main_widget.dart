import 'package:flutter/material.dart';

class ButtonMainWidget extends StatelessWidget {
  ButtonMainWidget({
    Key? key,
    required this.text,
    this.isEnable = true,
    this.border,
    this.onTap,
    this.borderRadius = 5,
    required this.backgroundColor,
  }) : super(key: key);
  Widget text;
  bool isEnable;
  BoxBorder? border;
  Function()? onTap;
  Color backgroundColor;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      decoration: BoxDecoration(
        // color: backgroundColor,
        color: isEnable ? backgroundColor : backgroundColor.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        border: border ?? null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: !isEnable ? Colors.transparent : null,
          highlightColor: !isEnable ? Colors.transparent : null,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: text,
            ),
          ),
        ),
      ),
    );
  }
}
