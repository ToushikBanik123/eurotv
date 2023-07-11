import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static String _keyPhoneNumber = "PHONENUMBER";
  static String _keyTokenId = "TOKENID";
  static String _keyLoginStatus = "LOGINSTATUS";

  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  /// Phone number
  static Future setPhoneNumber(String value) async =>
      await _preferences.setString(_keyPhoneNumber, value);

  static String? getPhoneNumber() => _preferences.getString(_keyPhoneNumber);

  /// Token ID
  static Future setTokenId(String value) async =>
      await _preferences.setString(_keyTokenId, value);

  static String? getTokenId() => _preferences.getString(_keyTokenId);

  /// Login status
  static Future setLoginStatus(bool value) async =>
      await _preferences.setBool(_keyLoginStatus, value);

  static bool? getLoginStatus() => _preferences.getBool(_keyLoginStatus);



}



