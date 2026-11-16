import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserModel.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _userModel;

  UserModel? get currentUser => _userModel;

  UserModel get userModel =>
      _userModel ?? (throw StateError('No signed-in user.'));

  set userModel(UserModel value) {
    _userModel = value;
    notifyListeners();
  }

  static Future<void> saveUserData(UserModel userModel) async {
    final preferences = await SharedPreferences.getInstance();
    final profile = userModel.toMap()..remove('password');
    await preferences.setString('user', jsonEncode(profile));
  }

  static Future<UserModel?> getUserData() async {
    final preferences = await SharedPreferences.getInstance();
    final stored = preferences.getString('user');
    if (stored == null || stored.isEmpty) return null;
    try {
      final decoded = jsonDecode(stored);
      if (decoded is! Map<String, dynamic>) return null;
      final user = UserModel.fromMap(decoded);
      return user.email.isEmpty && user.id.isEmpty ? null : user;
    } on FormatException {
      return null;
    }
  }

  static Future<void> deleteUserData() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('user');
  }
}
