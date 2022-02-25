import 'dart:async';

import 'package:flutter/material.dart';
import 'package:msbd_app/models/ms_answer_entity.dart';
import 'package:msbd_app/services/http.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';


class AnswerModel with ChangeNotifier {

  int counter = 0;


  void nextQuestion(){
    counter ++;
    print(counter);
    notifyListeners();
  }
}

class AnswerDetail extends StatelessWidget {
  const AnswerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text('${context.watch<AnswerModel>().counter}'),
          title: Consumer<AnswerModel>(builder: (context, answer, child){
            return Text('${answer.counter}');
          })
        ),
        // drawer: DrawerQuestionList(),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SingleChildScrollView(
                    child: Html(
                      data: "asd",
                      style: {
                        "p": Style(
                          color: Colors.green,
                        )},
                    ),
                  ),
                ),
              )
            ]),
        bottomSheet: Container(
          height: 90,
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  final answer = context.read<AnswerModel>();
                  answer.nextQuestion();
                  // context.read<AnswerModel>().nextQuestion();
                },
                child: Card(
                    child: Text(
                      "下一题",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18, height: 1.2),
                    )),
              ),
            ],
          ),
        ));
  }
}


class AnswerShow extends StatelessWidget {
  const AnswerShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
          create: (context) => AnswerModel(),
          child: AnswerDetail()
        );
  }
}

