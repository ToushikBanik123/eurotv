import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tvapp/Screens/Login/CreateAccount.dart';

import 'Provider/SharedPreferencesManager.dart';
import 'Provider/appProvider.dart';
import 'Screens/HomeLayout/HomeLayout.dart';
import 'Screens/Login/LoginInPopUpScrren.dart';
import 'Screens/Login/LoginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the preferred orientations to landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(MyApp());
}

class RouteConstants{
  static String homeScreen = 'HomeScreen';
  static String loginScreen = 'LoginScreen';
  static String loginInPopUpScrren = 'LoginInPopUpScrren';
  static String createAccount = 'CreateAccount';
  static String homeLayout = 'HomeLayout';
}



class ArrowLeftIntent extends Intent{}
class ArrowRightIntent extends Intent{}
class ArrowUpIntent extends Intent{}
class ArrowDownIntent extends Intent{}
class SelectButtonIntent extends Intent{}
class BackButtonIntent extends Intent{}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.homeScreen,
        path: '/',
        // builder: (context, state) =>  LoginInPopUpScrren(),
        builder: (context, state) =>  HomeLayout(),
      ),
      GoRoute(
        name: RouteConstants.loginScreen,
        path: '/LoginScreen',
        builder: (context, state) =>  LoginScreen(),
      ),
      GoRoute(
        name: RouteConstants.loginInPopUpScrren,
        path: '/LoginInPopUpScrren',
        builder: (context, state) =>   LoginInPopUpScrren(),
      ),
      GoRoute(
        name: RouteConstants.createAccount,
        path: '/CreateAccount',
        builder: (context, state) =>  CreateAccount(),
      ),
      GoRoute(
        name: RouteConstants.homeLayout,
        path: '/HomeLayout',
        builder: (context, state) =>  HomeLayout(),
      ),

    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>AppProvider()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            routerConfig: _router,
          ),
        );
      },
      // child: LoginInPopUpScrren(),
    );
  }
}

