import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    FocusNode usernameFocus = new FocusNode();
    FocusNode emailFocus = new FocusNode();
    FocusNode passwordFocus = new FocusNode();
    FocusNode confirmPasswordFocus = new FocusNode();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
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
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
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
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
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
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
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
              height: ScreenUtil().setHeight(20),
            ),
            Center(
              child: Container(
                 margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(70)),
                child: RaisedButton(
                  padding: EdgeInsets.all(14),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  onPressed: () {},
                  color: Color(0xff4ce4b1),
                  textColor: Colors.white,
                  child: Text("Sign Up", style: TextStyle(fontSize: 14)),
                ),
              ),
            ),
            Container(
                height:ScreenUtil().setHeight( MediaQuery.of(context).size.height),
                 width:ScreenUtil().setWidth(MediaQuery.of(context).size.width) ,
                color: Color(0xff4160ce),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Are you a doctor ?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                      child: Text(
                          "More than 60 milion patient are joined us to get the cure",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    Center(
                      child: Container(
                        width: ScreenUtil().setWidth(MediaQuery.of(context).size.width),
                        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(70),vertical: ScreenUtil().setHeight(20))
                          //  EdgeInsets.only(right: 90, left: 90, bottom: 40),
                        ,child: RaisedButton(
                          padding: EdgeInsets.all(14),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          onPressed: () {},
                          color: Colors.white,
                          textColor: Colors.white,
                          child: Text("Join Now",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff4160ce))),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
