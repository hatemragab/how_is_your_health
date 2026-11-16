import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('missing or malformed saved sessions remain signed out', () async {
    for (final stored in [null, '', '{broken', '[]', '{}']) {
      SharedPreferences.setMockInitialValues({
        if (stored != null) 'user': stored,
      });
      expect(await AuthProvider.getUserData(), isNull);
    }
  });
  test('old stored profiles restore without newly required fields', () async {
    SharedPreferences.setMockInitialValues({
      'user': jsonEncode({'name': 'Hatem', 'email': 'user@example.com'}),
    });
    final user = await AuthProvider.getUserData();
    expect(user?.name, 'Hatem');
    expect(user?.id, '');
    expect(user?.ABO, isEmpty);
  });
  test('saved names are escaped and passwords are not persisted', () async {
    SharedPreferences.setMockInitialValues({});
    final user = UserModel(
      name: 'Name "quoted"\nline',
      email: 'user@example.com',
      password: 'private',
      ABO: ['A+'],
    );
    await AuthProvider.saveUserData(user);
    final saved = jsonDecode(
      (await SharedPreferences.getInstance()).getString('user')!,
    ) as Map<String, dynamic>;
    expect(saved.containsKey('password'), isFalse);
    final restored = await AuthProvider.getUserData();
    expect(restored?.name, user.name);
    expect(restored?.ABO, ['A+']);
    await AuthProvider.deleteUserData();
    expect(await AuthProvider.getUserData(), isNull);
  });
}
