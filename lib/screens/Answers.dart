import 'package:flutter/material.dart';

class Answers extends StatefulWidget {
  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  List<String> list = [];
  var txt = TextEditingController();
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
              color: Colors.grey[200],
              child: Text(list[i]),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            );
          },
          itemCount: list.length,
          shrinkWrap: true,
        ),
      ),
      bottomNavigationBar: Container(
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
                    setState(() {
                      list.add("${txt.text}");
                    });
                    txt.clear();
                  },
                  child: Text('add'),
                ),
              ),
            ],
          )),
    );
  }
}
