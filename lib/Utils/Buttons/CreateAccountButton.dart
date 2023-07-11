import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts.dart';


class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
      ),
      alignment: Alignment.center,
      child: Text("Create Account",
        style: LoginModuleGrayText,
      ),
    );
  }
}