import 'dart:developer';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Provider/appProvider.dart';
import '../../Utils/Widgets/Clock.dart';
import '../../Utils/consts.dart';
import 'SidePanel.dart';
import 'ToggleScreen.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context,provider,child){
      return Expanded(
        child: Column(
          children: [
            Clock(),
            // Container(
            //   child: (provider.homeLayoutLabel == 'HOME') ? HomeToggleScreen(): OtherWidget(),
            // ),
            OtherWidget(),
          ],
        ),
      );
    });
  }
}

class HomeToggleScreen extends StatelessWidget {
  const HomeToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBlack, // Adjust the color as needed
      // Implement your TV channels screen here
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // People's icon and current time
            //const Clock(),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 60.sp,),
                  // First container (600x200)
                  Container(
                    height: 300.h,
                    width: 250.sp,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    alignment: Alignment.center,
                    child: Text("ADS",
                      style: GoogleFonts.poppins(
                        fontSize: 50.h,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // Second container (500x600)
                  Container(
                    height: 300.h,
                    width: 400.sp,
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),

                ],
              ),
            ),
            //Your shortcut channels
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.sp,vertical: 20.h),
              child: Text(
                'YOUR SHORTCUT CHANNELS',
                style: homeLayoutSidePanelTextStyle,
              ),
            ),
            // List of channels (50)
            Container(
              height: 150.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 50, // Replace with the actual count from the API call
                padding: EdgeInsets.symmetric(horizontal: 60.sp),
                itemBuilder: (context, index) {
                  final color = Color(0xFFFFFFFF - (index * 0x11111111));
                  return Container(
                    width: 250.sp,
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    decoration: BoxDecoration(
                      color: color, // Adjust the color as needed
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  );
                },
              ),
            ),
            // POPULAR LIVE TV
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.sp,vertical: 20.sp),
              child: Text(
                'POPULAR LIVE TV',
                style: homeLayoutSidePanelTextStyle,
              ),
            ),
            // List of POPULAR LIVE TV (50)
            Container(
              height: 150.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 50, // Replace with the actual count from the API call
                padding: EdgeInsets.symmetric(horizontal: 60.sp),
                itemBuilder: (context, index) {
                  final color = Color(0xFFFFFFFF - (index * 0x11111111));
                  return Container(
                    width: 250.sp,
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    decoration: BoxDecoration(
                      color: color, // Adjust the color as needed
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OtherWidget extends StatefulWidget {
  const OtherWidget({Key? key}) : super(key: key);

  @override
  State<OtherWidget> createState() => _OtherWidgetState();
}

class _OtherWidgetState extends State<OtherWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<AppProvider>(builder: (context,provider,child){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 60.sp),
              child: Text(provider.selectedLayoutLabel.toString(),
                style:  GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            );
          }),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 250.sp/150.h,
                crossAxisCount: 5, // Number of columns in the grid
                mainAxisSpacing: 10.0, // Spacing between each row
                crossAxisSpacing: 10.0, // Spacing between each column
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 60.sp),
              itemCount: 60, // Total number of containers in the grid
              itemBuilder: (context, index) {
                // Generate a random color for each container
                final color = Color((index * 0x11111111) + 0xFF000000);

                return test(
                  color: color,
                  index: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}



class test extends StatefulWidget {
  test({required this.color, required this.index , Key? key}) : super(key: key);
  Color color;
  int index;

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          //isFocused = true;
        });
        // Handle onTap event
      },
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
          // provider.setHomeLayoutLabel(widget.label);
          // print(provider.homeLayoutLabel);
        });
        // Handle onFocusChange event
      },
      child: Container(
        height: 250,
        width: 150,
        color: isFocused ? Colors.red : widget.color,
        alignment: Alignment.center,
        child: Text(
          'Container ${widget.index}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
