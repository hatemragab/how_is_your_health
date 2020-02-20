import 'package:statusbar_util/statusbar_util.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Registration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode useNameFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

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
              color: Color(0xff4160ce),
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
                        autofocus: false,
                        focusNode: useNameFocus,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "Username",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          autofocus: false,
                          focusNode: passwordFocus,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Password",
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 10),
                      child: Text(
                        "Forget Your Password ?",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: RaisedButton(
                          padding: EdgeInsets.all(14),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                          onPressed: () {},
                          color: Color(0xff4ce4b1),
                          textColor: Colors.white,
                          child: Text("Login".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white),
                          ),
                          onPressed: () {},
                          color: Colors.transparent,
                          textColor: Colors.white,
                          child: Text("connect with facebook ".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white),
                          ),
                          onPressed: () {},
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text("Connect with G-mail ".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                      ),
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
                          style: TextStyle(color: Colors.white),
                        )))
                    ,SizedBox(height: 15,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
