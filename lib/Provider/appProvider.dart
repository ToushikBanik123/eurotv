
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AppProvider with ChangeNotifier{

  late String _selectedLayoutLabel = 'HOME';
  List<Map<String, dynamic>> _categories = [];

  get selectedLayoutLabel => _selectedLayoutLabel;
  get categories => _categories;


  void setHomeLayoutLabel(String value){
    _selectedLayoutLabel = value;
    notifyListeners();
  }

  void setCategories(Map<String, dynamic> value){
    _categories = value as List<Map<String, dynamic>>;
    _selectedLayoutLabel = _categories[0]['cat_name'].toString();
    notifyListeners();
  }



}