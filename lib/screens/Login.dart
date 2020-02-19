import 'package:statusbar_util/statusbar_util.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode useNameFocus = new FocusNode();
  FocusNode useNamePassword = new FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
// 0xff4160ce
  @override
  Widget build(BuildContext context) {
    StatusbarUtil.setTranslucent();
    StatusbarUtil.setStatusBarFont(FontStyle.black);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            child: Image.asset(
              "assets/doctor.jpg",
              height: MediaQuery.of(context).size.height / 3,fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xff4160ce),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: TextField(
                 style: TextStyle(color: Colors.white),
                 decoration: InputDecoration(
                   labelStyle: TextStyle(color: Colors.white),
                   labelText: "Username",
                 ),
               ),
             ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: TextField(

                   style: TextStyle(color: Colors.white),
                   decoration: InputDecoration(
focusColor: Colors.white,
                     labelStyle: TextStyle(color: Colors.grey),
                 labelText: "Password",
               )),
             ),
             SizedBox(
               height: 15,
             ),
             Container(
               margin: EdgeInsets.only(left: 200),
               child: Text(
                 "Forget Your Password ?",
                 style: TextStyle(color: Colors.white70),
               ),
             ),
             SizedBox(
               height: 60,
             ),
             SizedBox(
               height: 40,
               width: 350,
               child: RaisedButton(
                 onPressed: null,
                 shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(18.0),
                     side: BorderSide(color: Colors.blueAccent)),
               ),
             )
              ],
            ),
          )
        ],
      ),
    );
  }


}
