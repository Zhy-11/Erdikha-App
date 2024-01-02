import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  InputTextWidget({
    super.key,
    this.title,
    this.hintText,
    this.prefix,
    // this.errorMsg,
    this.suffix,
    this.onChanged,
    this.onFocus,
    this.textInputAction,
    // this.onEditingComplete,
    // this.onTapOutside,
    this.textInputType = TextInputType.text,
    // this.borderColor = LightColors.notSelected,
    this.maxLines = 1,
    this.isPassword = false,
    // this.iconMandatory = false,
    // this.numberFormater = false,
    // this.isCloseKeyboardWhenTapOutside = false,
    // this.enable = true,
    // this.suffix,
    // this.initialValue,
    this.onTap,
  });
  Function(String)? onChanged;
  Function(bool)? onFocus;
  // Function(PointerDownEvent)? onTapOutside;
  String? title;
  String? hintText;
  // String? errorMsg;
  // String? initialValue;
  int maxLines;
  bool isPassword;
  // bool iconMandatory;
  // bool numberFormater;
  // bool isCloseKeyboardWhenTapOutside;
  Widget? prefix;
  Widget? suffix;
  // Color borderColor;
  VoidCallback? onTap;
  // bool enable;
  // VoidCallback? onEditingComplete;
  TextInputAction? textInputAction;
  TextInputType textInputType;

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  bool hideText = true;
  FocusNode _focus = FocusNode();

  void showText() {
    setState(() {
      hideText = !hideText;
    });
  }

  void _onFocusChange() {
    if (widget.onFocus != null) widget.onFocus!(_focus.hasFocus);
  }

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Row(
              children: [
                Text(
                  widget.title ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // if (widget.iconMandatory) ...[
                //   TextNormalRegular(
                //     value: "*",
                //     color: LightColors.red,
                //   ),
                // ]
              ],
            ),
            SizedBox(height: 4),
          ],
          TextFormField(
            // style: TextStyle(color: LightColors.mainText),
            // cursorColor: LightColors.mainText,
            keyboardType: widget.textInputType,
            obscureText: widget.isPassword == true ? hideText : false,
            maxLines: widget.maxLines,
            focusNode: _focus,
            // enabled: widget.enable,
            // initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            textInputAction: widget.textInputAction,
            onEditingComplete: () {
              if (widget.textInputAction == TextInputAction.next) {
                FocusScope.of(context).nextFocus();
                if (widget.isPassword) {
                  FocusScope.of(context).nextFocus();
                }
              } else {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              // if (widget.isPassword &&
              //     widget.textInputAction == TextInputAction.next) {}
            },
            // scribbleEnabled: false,
            // canRequestFocus: false,
            // textCapitalization: TextCapitalization.none,
            // readOnly: true,
            // autocorrect: false,
            // enableSuggestions: false,
            onTap: widget.onTap,
            // onTapOutside: (event) {
            //   if (widget.isCloseKeyboardWhenTapOutside) {
            //     FocusManager.instance.primaryFocus?.unfocus();
            //   }
            // },
            // inputFormatters: widget.numberFormater
            //     ? [ThousandsSeparatorInputFormatter()]
            //     : null,
            // (value) {
            //   if (widget.enable) {
            //     widget.onChanged!(value);
            //   }
            // },
            decoration: InputDecoration(
              // focusColor: LightColors.mainText,
              // hoverColor: LightColors.mainText,
              // filled: !(widget.enable),
              // fillColor: widget.onTap == null
              //     ? LightColors.border
              //     : LightColors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              // contentPadding: EdgeInsets.zero,
              // labelText: widget.initialValue,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6000000238418579),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                // fontSize: 16,
              ),
              // labelStyle: TextStyle(
              //   color: LightColors.mainText,
              // fontSize: 16,
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Color(0xffa8a8a8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                    // color: widget.borderColor,
                    color: Color(0xffa8a8a8)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Color(0xffa8a8a8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Color(0xffa8a8a8)
                    // width: 2,
                    ),
              ),
              prefixIcon: widget.prefix,
              // prefixIconColor: LightColors.mainColor.withOpacity(0.7),
              // suffixIconColor: LightColors.mainColor,
              // suffix: TextNormalRegular(value: "Kg"),
              // suffixText: "Kg",
              suffixIcon: widget.isPassword == true
                  // ? widget.value != null
                  ? IconButton(
                      onPressed: showText,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Icon(hideText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    )
                  // : nulla
                  : widget.suffix != null
                      ?
                      // IconButton(
                      //     onPressed: showText,
                      //     splashColor: Colors.transparent,
                      //     highlightColor: Colors.transparent,
                      //     icon: TextMediumRegular(value: "Kg"),
                      //   ),
                      widget.suffix
                      : null,
              // ),
            ),
          ),
          // if (widget.errorMsg != null && widget.errorMsg != "") ...[
          //   SizedBox(height: 8),
          //   TextNormalRegular(
          //     value: widget.errorMsg,
          //     color: LightColors.red,
          //   ),
          // ],
        ],
      ),
    );
  }
}
