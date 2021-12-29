import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      padding: EdgeInsets.all(50),
      height: 800,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red, width: 5.0)),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.local_library,
                size: 100,
              ),
              Icon(
                Icons.question_answer,
                size: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
