import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:how_is_your_health/Constants.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import 'Category.dart';
import 'Home.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  FocusNode usernameFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  FocusNode phoneFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();
  FocusNode confirmPasswordFocus = new FocusNode();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final bottom =100.0;
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //user Name TextField
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextField(
                          controller: usernameController,
                          autofocus: false,
                          focusNode: usernameFocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Username",
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //user Email TextField
                    Container(
                      child: TextField(
                          controller: emailController,
                          autofocus: false,
                          focusNode: emailFocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Email",
                          )),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextField(
                          controller: phoneController,
                          autofocus: false,
                          focusNode: phoneFocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Phone",
                          )),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //user Password TextField
                    Container(
                      child: TextField(
                          controller: passwordController,
                          autofocus: false,
                          focusNode: passwordFocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Password",
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //user Confirm Password TextField
                    Container(
                      child: TextField(
                          controller: confirmPasswordController,
                          autofocus: false,
                          focusNode: confirmPasswordFocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Confirm Password",
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //sign up bottom
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        onPressed: () {
                          // startRegister();
                          if (usernameController.text.isEmpty &&
                              emailController.text.isEmpty &&
                              passwordController.text.isEmpty &&
                              phoneController.text.isEmpty) {
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
                            if(passwordController.text == confirmPasswordController.text){
                              startRegister();
                            }else{
                              showDialog(
                                  context: context,
                                  builder: (x) {
                                    return AlertDialog(
                                      title: Text('error'),
                                      content: Text('password not match'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text('OK'),
                                        )
                                      ],
                                    );
                                  });
                            }

                          }
                        },
                        color: Color(0xff4ce4b1),
                        textColor: Colors.white,
                        child: Text("Sign Up", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //are you a doctor
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff4160ce),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Are you a doctor ?",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Text(
                    "More than 60 milion patient are joined us to get the cure",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              Container(
                width: ScreenUtil().setWidth(MediaQuery.of(context).size.width),
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(70),
                    vertical: ScreenUtil().setHeight(20))
                //  EdgeInsets.only(right: 90, left: 90, bottom: 40),
                ,
                child: RaisedButton(
                  padding: EdgeInsets.all(14),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    startRegister(isDoctor: true);
                  },
                  color: Colors.white,
                  textColor: Colors.white,
                  child: Text("Join Now",
                      style: TextStyle(fontSize: 16, color: Color(0xff4160ce))),
                ),
              )
            ],
          )),
    );
  }

  startRegister({isDoctor = false}) async {
    var req;
    if(isDoctor){
        req = await http.post('${Constants.SERVERURL}createUsers', body: {
        'name': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
        'is_doctor': '1',
      });
    }else{
        req = await http.post('${Constants.SERVERURL}createUsers', body: {
        'name': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
          'is_doctor': '0',
      });
    }


    print(req.body);

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
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Category()));
    } else {
      showDialog(
          context: context,
          builder: (x) {
            return AlertDialog(
              title: Text('error'),
              content: Text('${res['data']}'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.pop(context), child: Text('OK'))
              ],
            );
          });
      Fluttertoast.showToast(msg: res['data']);
    }
  }


}
