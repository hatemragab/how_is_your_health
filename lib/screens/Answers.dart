import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/AnswerModel.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import '../Constants.dart';

class Answers extends StatefulWidget {
  int question_id;

  Answers(this.question_id);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  List<AnswerModel> list = [];
  UserModel userModel;
  var txt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = Provider.of<AuthProvider>(context, listen: false).userModel;
    getAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('answer'),
          elevation: 1,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: ListView.builder(
            itemBuilder: (c, i) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      color: Colors.grey[200],
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 5,top: 3),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'DR: ${list[i].doctor_name}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(list[i].answer),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            },
            itemCount: list.length,
            shrinkWrap: true,
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: userModel.is_doctor == "1",
          child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Add Answer'),
                      controller: txt,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        addAnswer();
                      },
                      child: Text('add'),
                    ),
                  ),
                ],
              )),
        ));
  }

  void addAnswer() async {
    var req = await http.post('${Constants.SERVERURL}createAnswer', body: {
      'question_id': '${widget.question_id}',
      'answer': '${txt.text}',
      'doctor_name': '${userModel.name}',
    });

    var res = convert.jsonDecode(req.body);
    print(res);
    bool err = res['error'];
    if (!err) {
      setState(() {
        list.add(
            AnswerModel(answer: "${txt.text}", doctor_name: userModel.name));
      });
      txt.clear();
    } else {
      Fluttertoast.showToast(msg: 'error try again !');
    }
  }

  void getAnswers() async {
    var req = await http.post('${Constants.SERVERURL}getAllAnswers', body: {
      'question_id': '${widget.question_id}',
    });

    var res = convert.jsonDecode(req.body);
    print(res);
    bool err = res['error'];
    if (!err) {
      List data = res['data'];
      List<AnswerModel> temp = [];
      for (int i = 0; i < data.length; i++) {
        temp.add(AnswerModel(
            id: data[i]['id'],
            doctor_name: data[i]['doctor_name'],
            answer: data[i]['answer'],
            date: data[i]['created_at']));
      }
      setState(() {
        list = temp;
      });
    } else {
      setState(() {
        list = [];
      });
    }
  }
}
