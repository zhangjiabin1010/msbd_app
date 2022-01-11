import 'package:flutter/material.dart';
import 'package:msbd_app/pages/widgets/button_icon_text.dart';

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
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Row(children: [
                  Text(
                    "问题标题",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  IconButton(icon: Icon(Icons.star), onPressed: () {})
                ])),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                        'Your text.....Your text.Your text.Your text.Your text...')),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
            height: 90,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Row(children: [
              ButtonIconText(Icons.account_balance_sharp, "666"),
              ButtonIconText(Icons.ac_unit_outlined, "777"),
              ButtonIconText(Icons.alarm_on, "888"),
            ])));
  }
}
