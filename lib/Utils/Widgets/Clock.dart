import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    // Start the timer to update the current time every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    // Format the current time as a string
    return '${now.hour} : ${now.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.person_rounded, color: Colors.white),
        SizedBox(width: 20.sp),
        Text(
          _currentTime,
          style: homeLayoutClockTextStyle,
        ),
        SizedBox(width: 20.sp),
      ],
    );
  }
}
