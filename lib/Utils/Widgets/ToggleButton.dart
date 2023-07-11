import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Provider/appProvider.dart';
import '../../main.dart';
import '../consts.dart';


class ToggleButton extends StatefulWidget {
  final String label;
  final String imagePath;

   ToggleButton(
      this.label,
      this.imagePath,
      );

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isFocused = false;


  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context,provider,child){
      return Actions(
          actions: <Type, Action<Intent>>{
            SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
              // final String location = context.namedLocation(
              //   'CreateAccount',
              // );
              // context.go(location);
              print("object");
            }),
          },
          child: InkWell(
            onTap: () {
              setState(() {
                //isFocused = true;
              });
              // Handle onTap event
            },
            onFocusChange: (hasFocus) {
              setState(() {
                isFocused = hasFocus;
                provider.setHomeLayoutLabel(widget.label);
                print(provider.selectedLayoutLabel);
              });
              // Handle onFocusChange event
            },
            child: Container(
              width: 350.sp,
              height: 70.sp,
              decoration:  BoxDecoration(
                color: (provider.selectedLayoutLabel == widget.label) ? appLightRed : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 70.sp,),
                  ImageIcon(
                    NetworkImage(widget.imagePath,),
                    size: 24.sp,
                    color: isFocused ? Colors.white : Colors.white,
                  ),

                  SizedBox(width: 20.sp),
                  Text(
                    widget.label,
                    style:  GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: isFocused ? Colors.white : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    });
  }
}



