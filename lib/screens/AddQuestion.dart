import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
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
                decoration: InputDecoration(hintText: 'Question'),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(hintText: 'Age'),
              ),
              SizedBox(height: 15,),
              RaisedButton(
                onPressed: () {},
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
