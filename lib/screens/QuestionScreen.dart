import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/QuestionItemModel.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:how_is_your_health/screens/AddQuestion.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import '../Constants.dart';
import 'Answers.dart';

class QuestionScreen extends StatefulWidget {
  int postion;

  QuestionScreen(this.postion);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<QuestionItemModel> question = [];
  UserModel userModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = Provider.of<AuthProvider>(context, listen: false).userModel;
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddQuestion(widget.postion)));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('questions'),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: question.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          width: 40,
                          height: 40,
                          child: CircularProfileAvatar(
                            "",
                            child: Image.asset(
                                "assets/images/profile4.jpg"),
                            radius: 100,
                            elevation: 5.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "${question[index].userName}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                            Text("${question[index].question}", style:
                            TextStyle(fontSize: 17, color: Colors.black)),
                            SizedBox(
                              height: 5,
                            ),

                            Text("${question[index].date}",style: TextStyle(fontSize: 12),),
                          ],
                        )
                      ],
                    ),

                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Fluttertoast.showToast(msg: 'You Add Like');
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                color: Colors.lightBlueAccent,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text("Like"),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Answers(question[index].id)));
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.question_answer,
                                  color: Colors.lightBlueAccent),
                              SizedBox(
                                width: 3,
                              ),
                              InkWell(child: Text("Answer")),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: InkWell(
                            onTap: () {
                              shareText(question[index].question);
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.share,
                                    color: Colors.lightBlueAccent),
                                SizedBox(
                                  width: 3,
                                ),
                                Text("Share")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void shareText(var txt) async {
    await Share.share('${txt}');
  }


  void getQuestions() async {
    var req = await http.post('${Constants.SERVERURL}getAllQuestions', body: {
      'cat_id': '${widget.postion}',
    });

    var res = convert.jsonDecode(req.body);
    print(res);
    bool err = res['error'];
    if (!err) {
      List data = res['data'];
      List<QuestionItemModel> temp = [];
      for (int i = 0; i < data.length; i++) {
        temp.add(QuestionItemModel(
            id: data[i]['id'],
            userName: data[i]['user_name'],
            question: data[i]['question'],
            date: data[i]['created_at']));
      }
      setState(() {
        question = temp;

      });
    } else {
      setState(() {
        question = [];
      });
    }
  }
}
