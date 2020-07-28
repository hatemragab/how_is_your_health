import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import '../Constants.dart';


class AddQuestion extends StatefulWidget {
  int p;

  AddQuestion(this.p);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  UserModel userModel;
  var txt = TextEditingController();

  @override
  void initState() {
    userModel = Provider.of<AuthProvider>(context, listen: false).userModel;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15,),
              TextField(
                controller: txt,
                decoration: InputDecoration(hintText: 'Question'),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(hintText: 'Age'),
              ),
              SizedBox(height: 15,),
              RaisedButton(
                onPressed: () {
                  addQuestion();
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
  void addQuestion()async{
    var req = await http.post('${Constants.SERVERURL}create_questions', body: {
      'question': '${txt.text}',
      'cat_id': '${widget.p}',
      'user_name': '${userModel.name}',
    });

    var res = convert.jsonDecode(req.body);
    print(res);
    bool err = res['error'];
    if (!err) {
      Fluttertoast.showToast(msg: 'Question added ');
      txt.clear();
    }else{
    Fluttertoast.showToast(msg: 'error try again !');
    }

  }
}
