import 'package:flutter/material.dart';

class AnswerShow extends StatelessWidget {
  const AnswerShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("888888"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "问题标题",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                    'Your text.....Your text.Your text.Your text.Your text...')),
          ),
          Row(
            children: [
              Icon(Icons.add_alarm),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.account_tree_outlined))
            ],
          )
        ],
      ),
    );
  }
}
