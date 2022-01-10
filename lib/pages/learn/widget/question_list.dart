import 'package:flutter/material.dart';

Widget QuestionListItem(question_dict) {
  return InkWell(
    onTap: () {
      //发起网络请求，传值question_dict['id']
    },
    child: ListTile(
        title: Text(question_dict['title']),
        trailing:
            IconButton(icon: Icon(Icons.navigate_next), onPressed: () {})),
  );
}
