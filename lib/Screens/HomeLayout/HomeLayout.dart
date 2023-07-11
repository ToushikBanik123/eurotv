import 'dart:developer';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/consts.dart';
import '../../main.dart';
import 'SidePanel.dart';
import 'ToggleScreen.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ColorfulSafeArea(
        color: appBlack,
        child: Scaffold(
          backgroundColor: appBlack,
          body: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.arrowLeft): ArrowLeftIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowRight): ArrowRightIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowUp): ArrowUpIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowDown): ArrowDownIntent(),
              LogicalKeySet(LogicalKeyboardKey.select): SelectButtonIntent(),
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Side Panel
                SidePanel(),
                // TV Channels Screen
                ToggleScreen(),
              ],
            ),
          ),
        )
    );
  }
}













