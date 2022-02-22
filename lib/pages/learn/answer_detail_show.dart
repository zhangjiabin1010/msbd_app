import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:msbd_app/models/ms_question_entity.dart';
import 'package:msbd_app/pages/widgets/button_icon_text.dart';
import 'package:msbd_app/services/http.dart';
import 'package:flutter_html/flutter_html.dart';




class AnswerShow extends StatefulWidget {
  const AnswerShow({Key? key}) : super(key: key);

  @override
  _AnswerShowState createState() => _AnswerShowState();
}

class _AnswerShowState extends State<AnswerShow> {

  Data? Answer;
  var _futureBuilderFuture;


  Future getAnswer() async {

    var response = Http.get('ms_answer_show', params: {}, needCode: false);
        // .then((res) => {
        //       // Answer = Data.fromJson(res)
        //   });
    return response;
  }

  @override
  initState() {
    super.initState();
    _futureBuilderFuture = getAnswer();

  }

  void refresh_answer() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    var question_id = Answer?.id;
    print('xxxxxxxxxxxxxxxxxx');
    print(question_id);
    print('xxxxxxxxxxxxxxxxxx');
    var title = Answer?.question;
    var answer = Answer?.answer == null? "":Answer?.answer;
    return Scaffold(
        appBar: AppBar(
          title: Text("888888"),
        ),
        drawer: DrawerQuestionList(),
        body:
            FutureBuilder(
              future: _futureBuilderFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    print('还没有开始网络请求');
                    return Text('还没有开始网络请求');
                  case ConnectionState.active:
                    print('active');
                    return Text('ConnectionState.active');
                  case ConnectionState.waiting:
                    print('waiting');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    print('done');
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    // return _createListView(context, snapshot);
                    return AnswerDetail(context, snapshot);
                  default:
                    return Text('还没有开始网络请求');
                }
              }
            ),
          // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //   Container(
          //       width: double.infinity,
          //       padding: EdgeInsets.only(left: 10),
          //       decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          //       child: Row(children: [
          //         Text(
          //           "${title}",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(fontSize: 20, color: Colors.red),
          //         ),
          //         IconButton(icon: Icon(Icons.star), onPressed: () {})
          //       ])),
          //   Expanded(
          //     child: Container(
          //       decoration:
          //           BoxDecoration(border: Border.all(color: Colors.black)),
          //       child: SingleChildScrollView(
          //         child: Html(
          //           data:answer,
          //           style: {
          //             "p": Style(
          //               color: Colors.green,
          //             )},
          //         ),
          //       ),
          //     ),
          //   )
          // ]),
        bottomSheet: Container(
            height: 90,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIconText(
                      question_id: question_id,
                      custom_icon: Icons.ac_unit_outlined,
                      custom_text: "收藏",
                      refresh_answer: refresh_answer),
                  ButtonIconText(
                      question_id: question_id,
                      custom_icon: Icons.add_chart,
                      custom_text: "拿下",
                      refresh_answer: refresh_answer),
                  ButtonIconText(
                      question_id: question_id,
                      custom_icon: Icons.alarm_on,
                      custom_text: "下一题",
                      refresh_answer: refresh_answer),
                ])));
  }
}

class DrawerQuestionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: const EdgeInsets.all(8.0),
                child: new Text('今天吃什么？ $index'),
              );
            }));
  }
}


Widget AnswerDetail(BuildContext context, AsyncSnapshot snapshot){
  var answer = snapshot.data;
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Row(children: [
          Text(
            "${ answer['question']}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          IconButton(icon: Icon(Icons.star), onPressed: () {})
        ])),
    Expanded(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black)),
        child: SingleChildScrollView(
          child: Html(
            data:answer['answer'],
            style: {
              "p": Style(
                color: Colors.green,
              )},
          ),
        ),
      ),
    )
  ]);
}