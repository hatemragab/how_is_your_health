import 'package:flutter/material.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/screens/Login.dart';
import 'package:how_is_your_health/screens/startPage.dart';
import 'package:provider/provider.dart';
import 'package:statusbar_util/statusbar_util.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // setStatusBarFontStyle

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartPage(),
      ),
    );
  }
}
