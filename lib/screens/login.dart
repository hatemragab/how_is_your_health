import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset("assets/doctor.jpg"),
          ),
          Expanded(
              child: Stack(
            children: <Widget>[
              Container(
                color: Colors.blue[800],
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        decoration: InputDecoration(
                      labelText: "Password",
                    )),
                  ),
                  SizedBox(height: 15,)
                  ,Container(margin: EdgeInsets.only(left: 200),
                    child: Text(
                      "Forget Your Password ?",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                  ,SizedBox(height: 60,)
                  ,SizedBox(height: 40,
                    width: 350,
                    child: RaisedButton(onPressed: null,shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueAccent)
                    ),),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
