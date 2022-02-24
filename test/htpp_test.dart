import 'dart:async';

import 'package:flutter/material.dart';
import 'package:msbd_app/models/ms_answer_entity.dart';
import 'package:msbd_app/pages/widgets/button_icon_text.dart';
import 'package:msbd_app/services/http.dart';
import 'package:flutter_html/flutter_html.dart';



class AnswerShow extends StatefulWidget {
  const AnswerShow({Key? key}) : super(key: key);

  @override
  _AnswerShowState createState() => _AnswerShowState();
}

class _AnswerShowState extends State<AnswerShow> {
  var _futureBuilderFuture;

  Future getAnswer() async {
    // var response = Http.get('ms_answer_show', params: {}, needCode: false);
    var response = Http.get('servers_data_handle', params: {}, needCode: false);
    return response;
  }

  @override
  initState() {
    super.initState();
    print('第一次请求');
    _futureBuilderFuture = getAnswer();
    print('第一次请求');


  }

  void refresh_answer() {
    print('刷新请求');
    _futureBuilderFuture = getAnswer();
    print('刷新请求');

  }

  @override
  Widget build(BuildContext context) {
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
                  return AnswerDetailWidget(context, snapshot);
                default:
                  return Text('还没有开始网络请求');
              }
            }
        ),
        bottomSheet: Container(
            height: 90,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIconText(
                      custom_icon: Icons.ac_unit_outlined,
                      custom_text: "收藏",
                      refresh_answer: refresh_answer),
                  ButtonIconText(
                      custom_icon: Icons.add_chart,
                      custom_text: "拿下",
                      refresh_answer: refresh_answer),
                  ButtonIconText(
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


Widget AnswerDetailWidget(BuildContext context, AsyncSnapshot snapshot){
  var answer = snapshot.data;
  print('xxxxxxxxxxxxxxxxxx');
  print(answer);
  print('xxxxxxxxxxxxxxxxxx');

  Data? Answer = Data.fromJson(answer);
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Row(children: [
          Text(
            "${ Answer.question }",
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
            data:Answer.answer,
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