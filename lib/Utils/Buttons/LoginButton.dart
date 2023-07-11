import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Provider/appProvider.dart';
import '../consts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Consumer<AppProvider>(builder: (context,provider,child) {
      return Container(
        width: double.infinity,
        height: 80.sp,
        margin: EdgeInsets.symmetric(vertical: 50.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          gradient: buttonColorGradient,
        ),
        alignment: Alignment.center,
        child: Text("Login..",
          style:  LoginModuleWhiteText,
        ),
      );
    });
  }
}