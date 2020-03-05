import 'package:flutter/material.dart';
import 'package:how_is_your_health/models/QuestionItemModel.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<QuestionItemModel> question = QuestionItemModel.questionModel;

  int idOfVis = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Nav to add question page
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: ListView.builder(
          shrinkWrap: true,
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
                                "${question[index].imageUserProfile}"),
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
                                  TextStyle(fontSize: 20, color: Colors.blue),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${question[index].date}"),
                          ],
                        )
                      ],
                    ),
                    Text("${question[index].question}"),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              idOfVis = question[index].id;
                            });
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
                          onTap: () {},
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
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.share, color: Colors.lightBlueAccent),
                              SizedBox(
                                width: 3,
                              ),
                              Text("Share")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(visible: idOfVis==question[index].id ? true:false, child: Text('frist ans')),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
