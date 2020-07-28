import 'package:flutter/material.dart';
import 'package:how_is_your_health/Constants.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:how_is_your_health/screens/Home.dart';
import 'package:how_is_your_health/screens/Login.dart';
import 'package:how_is_your_health/screens/Registration.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    new Future.delayed(const Duration(milliseconds: 3500), () async {
      //check if email is save to start login if not Navigate to WelcomePage
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String email = sharedPreferences.getString('user');

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

      if (email != null) {
        UserModel userModel = await AuthProvider.getUserData();
        Provider.of<AuthProvider>(context, listen: false).userModel = userModel;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Category()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Login()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(),
            Container(),
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
            ),
            Container(),
            Container(),
            Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 20, height: 20, child: CircularProgressIndicator(backgroundColor: Colors.white,)),
                ],
              ),
            )
          ],
        ),
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
