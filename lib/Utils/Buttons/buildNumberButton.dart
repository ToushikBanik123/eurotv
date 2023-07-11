import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class buildNumberButton extends StatelessWidget {
  buildNumberButton({
    required this.text,
    required this.boxDecoration,
    required this.style,
    Key? key}) : super(key: key);

  String text;
  BoxDecoration boxDecoration;
  TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 100.sp,
      decoration: boxDecoration,
      child: Center(
        child: Text(
          text != null ? text.toString() : '',
          style: style,
        ),
      ),
    );
  }
}




class buildBackspaceButton extends StatelessWidget {
  buildBackspaceButton({
    required this.boxDecoration,
    Key? key}) : super(key: key);
  BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 100.sp,
      decoration: boxDecoration,
      child: const Icon(
        Icons.backspace,
        color: Colors.white,
      ),
    );
  }
}