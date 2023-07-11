import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Color GrayShade1 = Color(0xFF404258);
Color GrayShade2 = Color(0xFF474E68);
Color GrayShade3 = Color(0xFF50577A);
Color GrayShade4 = Color(0xFF6B728E);
const Color appBlack = Color(0xFF191919);
const Color appLightGray = Color(0xFF292929);
const Color appLightRed = Color(0xFF611516);

Gradient buttonColorGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFDB1FBF), Color(0xFFDE5836)],
);

TextStyle LoginModuleWhiteText = GoogleFonts.openSans(
  color: Colors.white,
  fontSize: 28.sp,
);
TextStyle LoginModuleSmallWhiteText = GoogleFonts.openSans(
  color: Colors.white,
  fontSize: 20.sp,
);

TextStyle LoginModuleLargeWhiteText = GoogleFonts.openSans(
  color: Colors.white,
  fontSize: 60.sp,
);

TextStyle LoginModuleGrayText =GoogleFonts.openSans(
  color: GrayShade4,
  fontSize: 28.sp,
);

TextStyle LoginModuleLightGrayText =GoogleFonts.openSans(
  color: Colors.grey.shade600,
  fontSize: 25.sp,
);

TextStyle errorText =  GoogleFonts.openSans(
  color: Colors.orange,
  fontSize: 20.sp,
);
TextStyle successText =  GoogleFonts.openSans(
  color: Colors.green,
  fontSize: 25.sp,
);



//Constant Text Styles
TextStyle homeLayoutSidePanelTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 30.h,

);
TextStyle homeLayoutClockTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 30.h,

);