import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../Provider/SharedPreferencesManager.dart';
import '../../Utils/Buttons/buildNumberButton.dart';
import '../../Utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isPhoneNumberSelected = true;
  bool _isTokenIdSelected = false;
  bool _noError = true;
  late String _errorText = "";

  late String _tokenId;
  late String _phoneNumber;

  FocusNode? _FocousNode_0;
  FocusNode? _FocousNode_1;
  FocusNode? _FocousNode_2;
  FocusNode? _FocousNode_3;
  FocusNode? _FocousNode_4;
  FocusNode? _FocousNode_5;
  FocusNode? _FocousNode_6;
  FocusNode? _FocousNode_7;
  FocusNode? _FocousNode_8;
  FocusNode? _FocousNode_9;
  FocusNode? _FocousNode_oK;
  FocusNode? _FocousNode_pop;
  FocusNode? _FocousNode_Back;
  FocusNode? _FocousNode_GetStarted;
  FocusNode? _FocousNode_IsPhoneNumberSelected;
  FocusNode? _FocousNode_IsTokenIdSelected;


  void setLoginFirstFocus(BuildContext context){
    if(_FocousNode_1 == null){
      _FocousNode_0 = FocusNode();
      _FocousNode_1 = FocusNode();
      _FocousNode_2 = FocusNode();
      _FocousNode_3 = FocusNode();
      _FocousNode_4 = FocusNode();
      _FocousNode_5 = FocusNode();
      _FocousNode_6 = FocusNode();
      _FocousNode_7 = FocusNode();
      _FocousNode_8 = FocusNode();
      _FocousNode_9 = FocusNode();
      _FocousNode_oK = FocusNode();
      _FocousNode_Back = FocusNode();
      _FocousNode_pop = FocusNode();
      _FocousNode_GetStarted = FocusNode();
      _FocousNode_IsPhoneNumberSelected = FocusNode();
      _FocousNode_IsTokenIdSelected = FocusNode();
      //FocusScope.of(context).requestFocus(_FocousNode_1);
      FocusScope.of(context).requestFocus(_FocousNode_1);
    }
  }

  void changeFocus(BuildContext context,FocusNode node){
    FocusScope.of(context).requestFocus(node);
    setState(() {

    });
  }

  void addNumber(int number) {
    setState(() {
      if(_isPhoneNumberSelected){
        _phoneNumber += number.toString();
      }
      if(_isTokenIdSelected){
        _tokenId += number.toString();
      }

    });
  }

  void removeNumber()  {
    setState(() {
      if(_isPhoneNumberSelected){
        _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1);
      }
      if(_isTokenIdSelected){
        _tokenId = _tokenId.substring(0, _tokenId.length - 1);
      }

    });
  }


  @override
  void initState() {
    super.initState();
    SharedPreferencesManager.init();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final tokenId = SharedPreferencesManager.getTokenId();
    final phoneNumber = SharedPreferencesManager.getPhoneNumber();

    if (tokenId != null && phoneNumber != null) {
      setState(() {
        _tokenId = tokenId;
        _phoneNumber = phoneNumber;
      });

      print("Data from the login screen : Phone Number  $_phoneNumber tokenId $_tokenId");
    }else{
      setState(() {
        _tokenId = "";
        _phoneNumber = "";
      });
    }
  }


  //TODO Need to fix the login and also need to create the keybord
  Future<void> login() async {
    // final tokenId = SharedPreferencesManager.getTokenId();
    // final phoneNumber = SharedPreferencesManager.getPhoneNumber();
    //_phoneNumber != null && _tokenId != null
    if (_phoneNumber != null && _tokenId != null) {
      //final apiUrl = 'http://103.137.75.66:8011/userdata?t=$_tokenId&api_key=secretkey&mac_address=$_phoneNumber';
      final apiUrl = 'http://103.137.75.66:8011/userdata?t=$_tokenId&api_key=secretkey&mac_address=$_phoneNumber';

      try {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          // Successful login
          print('Login successful');
          // Process the response or perform any other actions

          saveUserDataInCashay(_tokenId,_phoneNumber);
          // When the user logs in
          SharedPreferencesManager.setLoginStatus(true);

          bool? isLoggedIn = SharedPreferencesManager.getLoginStatus();
          print("Set the bool value : "+isLoggedIn.toString());

          print("Updated Login value is saved in the Cashey");

          //Navigating the Screen to the Home Screen
          final String location = context.namedLocation(
            'HomeLayout',
          );
          context.go(location);

        } else {
          // Handle login error
          setState(() {
            _noError = false;
            _errorText = 'Login failed with status code: ${response.statusCode}';
          });
          print('Login failed with status code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle network or server error
        setState(() {
          _noError = false;
          _errorText = error.toString();
        });
        print('Login failed with error: $error');
      }
    }
  }


  void saveUserDataInCashay(String tokenId, String phoneNumber) {
    SharedPreferencesManager.setTokenId(tokenId);
    SharedPreferencesManager.setPhoneNumber(phoneNumber);
    print('User data saved in Cashay: Token ID - $tokenId, Phone Number - $phoneNumber');

    //Navigating the Screen to the Login Screen
    final String location = context.namedLocation(
      'LoginScreen',
    );
    context.go(location);
  }


  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _FocousNode_0?.dispose();
    _FocousNode_1?.dispose();
    _FocousNode_2?.dispose();
    _FocousNode_3?.dispose();
    _FocousNode_4?.dispose();
    _FocousNode_5?.dispose();
    _FocousNode_6?.dispose();
    _FocousNode_7?.dispose();
    _FocousNode_8?.dispose();
    _FocousNode_9?.dispose();
    _FocousNode_oK?.dispose();
    _FocousNode_Back?.dispose();
    _FocousNode_pop?.dispose();
    _FocousNode_GetStarted?.dispose();
  }




  @override
  Widget build(BuildContext context) {
    if(_FocousNode_1 == null){
      setLoginFirstFocus(context);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          //color: GrayShade2,
          color: appLightGray,
        ),
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.arrowLeft): ArrowLeftIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowRight): ArrowRightIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowUp): ArrowUpIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): ArrowDownIntent(),
            LogicalKeySet(LogicalKeyboardKey.select): SelectButtonIntent(),
          },
          child: Row(
            children: [
              Container(
                width: 640.w,
                color: Colors.black,
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_oK!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_4!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_2!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),

                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(1);
                              }),
                            },
                            child: Focus(
                                focusNode: _FocousNode_1,
                                child: buildNumberButton(
                                  text: "1",
                                  boxDecoration: _FocousNode_1!.hasFocus?  BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    gradient: buttonColorGradient,
                                  ) : const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  style: _FocousNode_1!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                                )
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_0!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_5!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_3!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_1!);
                              }),
                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(2);
                              }),
                            },
                            child: Focus(
                                focusNode: _FocousNode_2,
                                child: buildNumberButton(
                                  text: "2",
                                  boxDecoration: _FocousNode_2!.hasFocus?  BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    gradient: buttonColorGradient,
                                  ) : const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  style: _FocousNode_2!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                                )
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_Back!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_6!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_2!);
                              }),
                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(3);
                              }),
                            },
                            child: Focus(
                                focusNode: _FocousNode_3,
                                child: buildNumberButton(
                                  text: "3",
                                  boxDecoration: _FocousNode_3!.hasFocus?  BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    gradient: buttonColorGradient,
                                  ) : const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  style: _FocousNode_3!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_1!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_7!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_5!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),

                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(4);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_4,
                              child: buildNumberButton(
                                text:"4",
                                boxDecoration: _FocousNode_4!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_4!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_2!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_8!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_6!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_4!);
                              }),



                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(5);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_5,
                              child: buildNumberButton(
                                text:"5",
                                boxDecoration: _FocousNode_5!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_5!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_3!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_9!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_5!);
                              }),



                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(6);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_6,
                              child: buildNumberButton(
                                text:"6",
                                boxDecoration: _FocousNode_6!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_6!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 30.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_4!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_oK!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_8!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),

                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(7);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_7,
                              child: buildNumberButton(
                                text:"7",
                                boxDecoration: _FocousNode_7!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_7!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_5!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_0!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_9!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_7!);
                              }),



                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(8);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_8,
                              child: buildNumberButton(
                                text:"8",
                                boxDecoration: _FocousNode_8!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_8!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_6!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_Back!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_8!);
                              }),



                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(9);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_9,
                              child: buildNumberButton(
                                text: "9",
                                boxDecoration: _FocousNode_9!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_9!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_7!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_1!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_0!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),

                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_oK,
                              child: buildNumberButton(
                                text: "oK",
                                boxDecoration: _FocousNode_oK!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_oK!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_8!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_2!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_Back!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_oK!);
                              }),



                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                addNumber(0);
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_0,
                              child: buildNumberButton(
                                text: "0",
                                boxDecoration: _FocousNode_0!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) : const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                style: _FocousNode_0!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                              ),
                            ),
                          ),
                          Actions(
                            actions: <Type, Action<Intent>>{
                              ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                                changeFocus(context,_FocousNode_9!);
                              }),
                              ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                                changeFocus(context,_FocousNode_3!);
                              }),
                              ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                                changeFocus(context,_FocousNode_GetStarted!);
                              }),
                              ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                                changeFocus(context,_FocousNode_0!);
                              }),



                              SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                                removeNumber();
                              }),
                            },
                            child: Focus(
                              focusNode: _FocousNode_Back,
                              child: buildBackspaceButton(
                                boxDecoration: _FocousNode_Back!.hasFocus?  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: buttonColorGradient,
                                ) :  const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome Back!",
                      style: LoginModuleLargeWhiteText,
                    ),
                    Text("Please login using your \n UID and Phone Number",
                      textAlign: TextAlign.center,
                      style: LoginModuleLightGrayText,
                    ),
                    SizedBox(height: 50.sp,),
                    Container(
                      width: 650.w,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text("Phone Number",
                        style: LoginModuleSmallWhiteText,
                      ),
                    ),
                    //PhoneNumber Input
                    Actions(
                      actions: <Type, Action<Intent>>{
                        ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                          changeFocus(context,_FocousNode_pop!);
                        }),
                        ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                          changeFocus(context,_FocousNode_IsTokenIdSelected!);
                        }),
                        ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                          changeFocus(context,_FocousNode_1!);
                        }),
                        ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                          changeFocus(context,_FocousNode_3!);
                        }),
                        SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                          setState(() {
                            _isTokenIdSelected = false;
                            _isPhoneNumberSelected = true;
                          });
                        }),
                      },
                      child: Focus(
                        focusNode: _FocousNode_IsPhoneNumberSelected,
                        child: Container(
                          width: 700.sp,
                          height: 80.sp,
                          decoration: _FocousNode_IsPhoneNumberSelected!.hasFocus ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.green, Colors.green],
                              ),
                              width: 3,
                            ),
                          ) : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            border: (_isPhoneNumberSelected) ? GradientBoxBorder(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFDB1FBF), Color(0xFFDE5836)],
                              ),
                              width: 3,
                            ) : Border(),
                          ),
                          alignment: Alignment.center,
                          child: Text(_phoneNumber.toString(),
                            textAlign: TextAlign.center,
                            style: LoginModuleGrayText,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   width: 700.sp,
                    //   height: 80.sp,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(50.r),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: TextFormField(
                    //     textAlign: TextAlign.center, // Aligns the label text at the center
                    //     style: LoginModuleGrayText, // Sets the style for the input text
                    //     decoration: const InputDecoration(
                    //       border: InputBorder.none,
                    //       alignLabelWithHint: true, // Aligns the label text with the input text
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 50.sp,),
                    Container(
                      width: 650.w,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text("UID",
                        style: LoginModuleSmallWhiteText,
                      ),
                    ),
                    //UID Input
                    Actions(
                      actions: <Type, Action<Intent>>{
                        ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                          changeFocus(context,_FocousNode_IsPhoneNumberSelected!);
                        }),
                        ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                          changeFocus(context,_FocousNode_GetStarted!);
                        }),
                        ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                          changeFocus(context,_FocousNode_1!);
                        }),
                        ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                          changeFocus(context,_FocousNode_3!);
                        }),
                        SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                          setState(() {
                            _isTokenIdSelected = true;
                            _isPhoneNumberSelected = false;
                          });
                        }),
                      },
                      child: Focus(
                        focusNode: _FocousNode_IsTokenIdSelected,
                        child: Container(
                          width: 700.sp,
                          height: 80.sp,
                          decoration: _FocousNode_IsTokenIdSelected!.hasFocus ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.green, Colors.green],
                              ),
                              width: 3,
                            ),
                          ) : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            border: (_isTokenIdSelected) ? const GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFDB1FBF), Color(0xFFDE5836)],
                              ),
                              width: 3,
                            ) : Border(),
                          ),
                          alignment: Alignment.center,
                          child: Text(_tokenId.toString(),
                            textAlign: TextAlign.center,
                            style: LoginModuleGrayText,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   width: 700.sp,
                    //   height: 80.sp,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(50.r),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: TextFormField(
                    //     textAlign: TextAlign.center, // Aligns the label text at the center
                    //     style: LoginModuleGrayText, // Sets the style for the input text
                    //     decoration: const InputDecoration(
                    //       border: InputBorder.none,
                    //       alignLabelWithHint: true, // Aligns the label text with the input text
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 50.sp,),
                    (_noError == false) ? Text(_errorText.toString(),
                        style: errorText
                    ) : const SizedBox(),
                    Actions(
                      actions: <Type, Action<Intent>>{
                        ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                          changeFocus(context,_FocousNode_IsTokenIdSelected!);
                        }),
                        ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                          changeFocus(context,_FocousNode_pop!);
                        }),
                        ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                          changeFocus(context,_FocousNode_1!);
                        }),
                        ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                          changeFocus(context,_FocousNode_3!);
                        }),



                        SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                          login();
                        }),
                      },
                      child: Focus(
                        focusNode: _FocousNode_GetStarted,
                        child: Container(
                          width: 300.sp,
                          height: 80.sp,
                          margin: EdgeInsets.symmetric(vertical: 50.sp),
                          decoration: _FocousNode_GetStarted!.hasFocus?  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            gradient: buttonColorGradient,
                          ) :  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          alignment: Alignment.center,
                          child: Text("Login...",
                            style: _FocousNode_GetStarted!.hasFocus? LoginModuleWhiteText : LoginModuleLightGrayText,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.sp),
                    Actions(
                      actions: <Type, Action<Intent>>{
                        ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                          changeFocus(context,_FocousNode_GetStarted!);
                        }),
                        // ArrowDownIntent : CallbackAction<ArrowDownIntent>(onInvoke: (ArrowDownIntent intent) {
                        //   changeFocus(context,_FocousNode_6!);
                        // }),
                        ArrowRightIntent : CallbackAction<ArrowRightIntent>(onInvoke: (ArrowRightIntent intent) {
                          changeFocus(context,_FocousNode_1!);
                        }),
                        ArrowLeftIntent : CallbackAction<ArrowLeftIntent>(onInvoke: (ArrowLeftIntent intent) {
                          changeFocus(context,_FocousNode_3!);
                        }),

                        SelectButtonIntent : CallbackAction<SelectButtonIntent>(onInvoke: (SelectButtonIntent intent) {
                          //Back to the Home Screen.
                          final String location = context.namedLocation(
                            'LoginInPopUpScrren',
                          );
                          context.go(location);
                        }),
                      },
                      child: Focus(
                        focusNode: _FocousNode_pop,
                        child: Container(
                          height: 80.sp,
                          width: 80.sp,
                          decoration: _FocousNode_pop!.hasFocus?  BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            gradient: buttonColorGradient,
                          ) : const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back,color: Colors.black,size: 30.sp,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
