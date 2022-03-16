import 'package:flutter/material.dart';
import 'package:msbd_app/pages/learn/learn_answer_show.dart';

class ButtonIconText extends StatelessWidget {
  final refresh_answer;
  final question_id;
  final custom_icon;
  final custom_text;

  ButtonIconText(
      {Key? key,
      this.refresh_answer,
      this.question_id,
      this.custom_icon,
      this.custom_text})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (custom_text == "下一题") {
            refresh_answer();
          } else if (custom_text == "收藏") {
            print("收藏");
          } else {
            print("会了");
          }
        },
        child: Card(
          child: Column(
            children: [
              Expanded(child: Icon(custom_icon)),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    child: Text(
                      "{$custom_text}",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18, height: 1.2),
                    )),
              ),
            ],
          ),
        ));
  }
}
