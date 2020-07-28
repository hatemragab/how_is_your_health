import 'package:fluttertoast/fluttertoast.dart';

import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:how_is_your_health/screens/Category.dart';
import 'package:statusbar_util/statusbar_util.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants.dart';
import 'Home.dart';
import 'Registration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode useNameFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// 0xff4160ce
  @override
  Widget build(BuildContext context) {
    var imgHight = MediaQuery.of(context).size.height / 3 + 40;
    //var imgContainer = imgHight *2 -80;
    StatusbarUtil.setTranslucent();
    StatusbarUtil.setStatusBarFont(FontStyle.black);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: imgHight,
            child: Image.asset(
              "assets/images/doctor.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white30,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: emailController,
                        autofocus: false,
                        focusNode: useNameFocus,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4ce4b1)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4ce4b1)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff4ce4b1)),
                          labelText: "email",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          controller: passwordController,
                          autofocus: false,
                          focusNode: passwordFocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff4ce4b1)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff4ce4b1)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff4ce4b1)),
                            labelText: "Password",
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: RaisedButton(
                        padding: EdgeInsets.all(14),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        onPressed: () {
                          // startLogin();

                          if (emailController.text.isEmpty &&
                              passwordController.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (x) {
                                  return AlertDialog(
                                    title: Text('error'),
                                    content: Text('missing some input'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            startLogin();
                          }
                        },
                        color: Color(0xff4ce4b1),
                        textColor: Colors.white,
                        child: Text("Login", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()),
                          );
                        },
                        child: Center(
                            child: Text(
                          "Sign Up and join our Community",
                          style: TextStyle(color: Colors.blueAccent),
                        ))),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  startLogin() async {


    try {
      var req = await http.post('${Constants.SERVERURL}userLogin', body: {
        'email': '${emailController.text}',
        'password': '${passwordController.text}',
      });
      print('res is ${req.body}');
      var res = convert.jsonDecode(req.body);

      bool err = res['error'];
      if (!err) {
        UserModel userModel = new UserModel(
            name: res['data']['name'],
            email: res['data']['email'],
            phone: res['data']['phone'],
            is_doctor: res['data']['is_doctor'],
            password: passwordController.text);
        Provider.of<AuthProvider>(context, listen: false).userModel = userModel;
        AuthProvider.saveUserData(userModel);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Category()));
      } else {
        Fluttertoast.showToast(msg: res['data']);
      }
    } catch (err) {
      print(err);
    }
  }


}
