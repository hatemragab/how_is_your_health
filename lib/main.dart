import 'package:flutter/material.dart';
import 'package:how_is_your_health/screens/Login.dart';
import 'package:statusbar_util/statusbar_util.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    // setStatusBarFontStyle

    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Login(),
    );
  }
}

