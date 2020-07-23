import 'package:flutter/material.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:how_is_your_health/screens/Home.dart';
import 'package:how_is_your_health/screens/Login.dart';
import 'package:how_is_your_health/screens/Registration.dart';
import 'package:provider/provider.dart';

import 'Category.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void getUserData() async {
    UserModel userModel = await AuthProvider.getUserData();

    if (userModel == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    } else {
      Provider.of<AuthProvider>(context, listen: false).userModel = userModel;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Category()),
          (Route<dynamic> route) => false);
    }
  }
}
