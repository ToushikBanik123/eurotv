import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tvapp/Provider/appProvider.dart';
import 'package:tvapp/Screens/HomeLayout/HomeLayout.dart';
import '../../Provider/SharedPreferencesManager.dart';
import '../../Utils/Buttons/LoginButton.dart';
import '../../Utils/consts.dart';
import '../../main.dart';
import 'LoginScreen.dart';






class LoginInPopUpScrren extends StatefulWidget {
  LoginInPopUpScrren({Key? key}) : super(key: key);

  @override
  State<LoginInPopUpScrren> createState() => _LoginInPopUpScrrenState();
}

class _LoginInPopUpScrrenState extends State<LoginInPopUpScrren> {
  FocusNode? _LoginButtonFocousNode_LoginInPopUpScrren;
  FocusNode? _CreateAccountButtonFocousNode_LoginInPopUpScrren;

  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _initializeLoginInfo();
  }

  Future<void> _initializeLoginInfo() async {
    await SharedPreferencesManager.init();
    _getLoginInfo();
  }

  void _getLoginInfo() {
    isLoggedIn = SharedPreferencesManager.getLoginStatus();
    setState(() {

    });
    print("the received value: " + isLoggedIn.toString());
  }




  void setLoginFirstFocus(BuildContext context){
    if(_LoginButtonFocousNode_LoginInPopUpScrren == null){
      _LoginButtonFocousNode_LoginInPopUpScrren = FocusNode();
      _CreateAccountButtonFocousNode_LoginInPopUpScrren = FocusNode();
      FocusScope.of(context).requestFocus(_LoginButtonFocousNode_LoginInPopUpScrren);
    }
  }

  void changeFocus(BuildContext context,FocusNode node){
    FocusScope.of(context).requestFocus(node);
    setState(() {

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _LoginButtonFocousNode_LoginInPopUpScrren?.dispose();
    _CreateAccountButtonFocousNode_LoginInPopUpScrren?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_LoginButtonFocousNode_LoginInPopUpScrren == null){
      setLoginFirstFocus(context);
    }

    if (isLoggedIn == true) {
      print("The next value : "+isLoggedIn.toString());
      return HomeLayout();
    } else if(isLoggedIn == false){
      // User is not logged in
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            //color: GrayShade2,
            color: appLightGray,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Container(
                height: 540.h,
                width: 960.w,
                padding: EdgeInsets.symmetric(horizontal: 120.sp),
                decoration: BoxDecoration(
                  //color: GrayShade1,
                  color: appBlack,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Consumer<AppProvider>(builder: (context,provider,child){
                  return Shortcuts(
                    shortcuts: <LogicalKeySet, Intent>{
                      LogicalKeySet(LogicalKeyboardKey.arrowLeft): ArrowLeftIntent(),
                      LogicalKeySet(LogicalKeyboardKey.arrowRight): ArrowRightIntent(),
                      LogicalKeySet(LogicalKeyboardKey.arrowUp): ArrowUpIntent(),
                      LogicalKeySet(LogicalKeyboardKey.arrowDown): ArrowDownIntent(),
                      LogicalKeySet(LogicalKeyboardKey.select): SelectButtonIntent(),
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/images/logo.png",
                          height: 150.h,
                        ),
                        Text("Endless TV Entertainment",
                          style: LoginModuleWhiteText,
                        ),
                        Actions(
                          actions: <Type, Action<Intent>>{
                            ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                              changeFocus(context,_CreateAccountButtonFocousNode_LoginInPopUpScrren!);
                            }),
                            SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                              final String location = context.namedLocation(
                                'LoginScreen',
                              );
                              context.go(location);
                            }),
                            ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                              changeFocus(context,_CreateAccountButtonFocousNode_LoginInPopUpScrren!);
                            }),
                          },
                          child: Focus(
                              focusNode: _LoginButtonFocousNode_LoginInPopUpScrren,
                              //child: LoginButton()
                              child: Container(
                                width: double.infinity,
                                height: 80.sp,
                                margin: EdgeInsets.symmetric(vertical: 50.sp),
                                decoration: _LoginButtonFocousNode_LoginInPopUpScrren!.hasFocus? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                  gradient: buttonColorGradient,
                                ) : BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ) ,
                                alignment: Alignment.center,
                                child: Text("Login..",
                                  style: _LoginButtonFocousNode_LoginInPopUpScrren!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                                ),
                              )
                          ),
                        ),
                        Actions(
                          actions: <Type, Action<Intent>>{
                            ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                              changeFocus(context,_LoginButtonFocousNode_LoginInPopUpScrren!);
                            }),
                            SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                              final String location = context.namedLocation(
                                'CreateAccount',
                              );
                              context.go(location);
                            }),
                            ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                              changeFocus(context,_LoginButtonFocousNode_LoginInPopUpScrren!);
                            }),
                          },

                          child: Focus(
                            focusNode: _CreateAccountButtonFocousNode_LoginInPopUpScrren,
                            child: Container(
                              width: double.infinity,
                              height: 80.sp,
                              decoration:_CreateAccountButtonFocousNode_LoginInPopUpScrren!.hasFocus?  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.r),
                                gradient: buttonColorGradient,
                              ) :  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              alignment: Alignment.center,
                              child: Text("Create Account",
                                //style: _CreateAccountButtonFocousNode_LoginInPopUpScrren!.hasFocus? LoginModuleGrayText : LoginModuleGrayText,
                                style: _CreateAccountButtonFocousNode_LoginInPopUpScrren!.hasFocus?  LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },),
              ),
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body: Center(
          child: Lottie.asset("assets/images/loadingAnimation.json",
            height: 300.sp,
          ),
        ),
      );
    }

  }
}





