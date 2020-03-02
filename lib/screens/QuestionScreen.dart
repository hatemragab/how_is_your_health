import 'package:flutter/material.dart';
import 'package:how_is_your_health/models/QuestionItemModel.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<QuestionItemModel> question = QuestionItemModel.questionModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: question.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              elevation: 4,
              child: Container(
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
                            SizedBox(height: 5,),
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
                          onTap: () {},
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
                        VerticalDivider(
                          thickness: 5,
                          width: 5,
                          color: Colors.black,
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
                              Text("Answer"),
                            ],
                          ),
                        ),
                        VerticalDivider(),
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          },

//          shrinkWrap: true,
//          itemCount: question.length,
//          itemBuilder: (BuildContext context, index) {
//            return Card(
//              color: Colors.lightBlueAccent,
//              elevation: 10,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(30.0)),
//              child: Column(
//                children: <Widget>[
//                  Container(
//                     child: Column(
//                      children: <Widget>[
//                        Row(
//                          children: <Widget>[
//                            Container(
//                              width: 25,
//                              height: 25,
//                              child: Image.asset(
//                                question[index].imageUserProfile,
//                                fit: BoxFit.cover,
//                              ),
//                            ),
//                            Text(question[index].userName)
//                          ],
//                        ),
//                        Text(question[index].question,style: TextStyle(fontSize: 25,color: Colors.black),),
//                      ],
//                    ),
//                  ),
//                  Divider(
//                    color: Colors.black,
//                  ),
//                  Container(
//                     child: Column(
//                      children: <Widget>[
//                        Row(
//                          children: <Widget>[
//                            Container(
//                              width: 25,
//                              height: 25,
//                              child: Image.asset(
//                                question[index].imageDoctorProfile,
//                                fit: BoxFit.cover,
//                              ),
//                            ),
//                            Text(question[index].doctorName)
//                          ],
//                        ),
//                        Text(question[index].answer,style: TextStyle(fontSize: 20,color: Colors.black),),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            );
//          }),
        ));
  }
}
