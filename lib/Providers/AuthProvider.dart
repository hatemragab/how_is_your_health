import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  UserModel userModel;

  static saveUserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', userModel.toString());

  }

  static getUserData( ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJson = preferences.getString('user');
    if(userJson ==null){
      return null;
    }else {
      var userMap = jsonDecode(userJson);
      return UserModel.fromMap(userMap);
    }
  }
  static deleteUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.remove('user');
  }
}
