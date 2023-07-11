import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../../Provider/SharedPreferencesManager.dart';
import '../../Utils/Buttons/buildNumberButton.dart';
import '../../Utils/consts.dart';
import '../../main.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  @override
  void initState() {
    super.initState();
    SharedPreferencesManager.init();
  }


  // TextEditingController _phoneNumberController = TextEditingController();
  Future<void> createUserAccount(String phoneNumber) async {
    final cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), ''); // Remove non-numeric characters from the phone number

    final url = Uri.parse('http://103.137.75.66:8011/generate_token?ph_number=$cleanPhoneNumber');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final tokenId = data['token_id'];

        print('User created successfully! with tokenID $tokenId');
        setState(() {
          _tokenId = tokenId;
        });

        // Save the user's token ID and phone number in Cashay
        saveUserDataInCashay(tokenId, cleanPhoneNumber);


      } else {
        print('Failed to create user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating user: $e');
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



  late String _phoneNumber = "";
  late String _tokenId = "";
  bool _validPhoneNumber = true;
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
      _phoneNumber += number.toString();
    });
  }

  void removeNumber() {
    setState(() {
      _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1);
    });
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
          //_FocousNode_pop
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
                    Text(
                      "Unlimited movies, TV shows and more!",
                      style: LoginModuleLargeWhiteText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Ready to watch? Enter your Phone Number to create or restart your membership.",
                      textAlign: TextAlign.center,
                      style: LoginModuleLightGrayText,
                    ),
                    SizedBox(height: 50.sp),
                    Container(
                      width: 650.w,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        "Phone Number",
                        style: LoginModuleSmallWhiteText,
                      ),
                    ),
                    Container(
                      width: 700.sp,
                      height: 80.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(_phoneNumber.toString(),
                        textAlign: TextAlign.center,
                        style: LoginModuleGrayText,
                      ),
                    ),
                    (_validPhoneNumber == false) ? SizedBox(height: 5.sp,) : const SizedBox(),
                    (_validPhoneNumber == false) ? Text("Please enter a valid PhoneNumber",
                      style: errorText
                    ) : const SizedBox(),
                    (_tokenId.isNotEmpty)? Text("User created successfully! with tokenID $_tokenId",
                        style: successText
                    ) :  const SizedBox(),
                    SizedBox(height: 30.sp),
                    Actions(
                      actions: <Type, Action<Intent>>{
                        // ArrowUpIntent : CallbackAction<ArrowUpIntent>(onInvoke: (ArrowUpIntent intent) {
                        //   changeFocus(context,_FocousNode_Back!);
                        // }),
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
                          if(_phoneNumber.isNotEmpty) {
                            createUserAccount(_phoneNumber);
                            setState(() {
                              _validPhoneNumber = true;
                            });
                          }
                          if(_phoneNumber.isEmpty){
                            setState(() {
                              _validPhoneNumber = false;
                            });
                          }
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
                          child: Text(
                            "Get Started...",
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










