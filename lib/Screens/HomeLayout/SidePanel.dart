// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../Utils/Widgets/ToggleButton.dart';
// import '../../Utils/consts.dart';
//
// class SidePanel extends StatefulWidget {
//   const SidePanel({Key? key}) : super(key: key);
//
//   @override
//   State<SidePanel> createState() => _SidePanelState();
// }
//
// class _SidePanelState extends State<SidePanel> {
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   List<Map<String, String>> categories = [];
//
//   void fetchData() async {
//     final url = Uri.parse('http://103.137.75.66:8011/api/v1/catlist');
//
//     try {
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//
//         if (data['status'] == 200) {
//           setState(() {
//             categories = List<Map<String, String>>.from(data['data']);
//           });
//         }
//       } else {
//         // Handle error cases if needed
//         print('API request failed with status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Handle connection or server errors
//       print('Error fetching data: $error');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 350.sp,
//       color: appLightGray, // Adjust the color as needed
//
//       // Column to hold the content
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // Logo of the channel provider
//           SizedBox(height: 40.sp),
//           Container(
//             width: 350.sp,
//             height: 120.sp,
//
//             // Logo image decoration
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/logo.png'),
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//           ),
//
//           // Toggles
//           SizedBox(height: 20.sp),
//           ToggleButton('HOME', 'assets/images/homes_logo.png'),
//           ToggleButton('NEWS', 'assets/images/news_logo.png'),
//           ToggleButton('MOVIES', 'assets/images/movies_logo.png'),
//           ToggleButton('DRAMA', 'assets/images/dramas_logo.png'),
//           ToggleButton('SPORTS', 'assets/images/sports_logo.png'),
//           ToggleButton('MUSIC', 'assets/images/music_logo.png'),
//           ToggleButton('RELIGION', 'assets/images/religion_logo.png'),
//         ],
//       ),
//     );
//   }
// }
//
//
//

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tvapp/Provider/appProvider.dart';

import '../../Utils/Widgets/ToggleButton.dart';
import '../../Utils/consts.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({Key? key}) : super(key: key);

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  List<Map<String, dynamic>> categories = [];

  @override
  void initState() {
    super.initState();
    print('Calling fetchData...');
    fetchData();

  }

  void fetchData() async {
    final url = Uri.parse('http://103.137.75.66:8011/api/v1/catlist');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 200) {
          setState(() {
            categories = (data['data'] as List)
                .map((item) => item as Map<String, dynamic>)
                .toList();
          });
          print('Categories updated: $categories');
          provider.setCategories(categories as Map<String, dynamic>);

        }
      } else {
        // Handle error cases if needed
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle connection or server errors
      print('Error fetching data: $error');
    }
  }


  AppProvider provider = AppProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.sp,
      color: appLightGray, // Adjust the color as needed

      // Column to hold the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo of the channel provider
          SizedBox(height: 40.sp),
          Container(
            width: 350.sp,
            height: 120.sp,

            // Logo image decoration
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Toggles
          SizedBox(height: 20.sp),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final category = categories[index];
                return ToggleButton(
                  category['cat_name'].toString(),
                  category['cat_logo']!.toString(),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
