import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:msbd_app/models/ms_question_entity.dart';

class DiscussPage extends StatefulWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  _DiscussPageState createState() => _DiscussPageState();
}

class _DiscussPageState extends State<DiscussPage> {
  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://www.fastmock.site/mock/8279d14ec2f5e5fb1f521b7fd2f77edc/msdb/msdb_app');

      var data = json.decode(response.toString());
      MsQuestionEntity ms_question_entity = MsQuestionEntity.fromJson(data);
      print(ms_question_entity.data[0].question);
      // Map<String, dynamic> data = json.decode(response_result);
      // print(data);
      // MsQuestionEntity ms_question_entity = MsQuestionEntity.fromJson(n);
      // List<dynamic> dataa = ms_question_entity.data;

      // print(dataa[0]);

      // MsQuestionEntity ms_question_entity = MsQuestionEntity.fromJson(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
        appBar: AppBar(title: Text("ssss")),
        body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: SingleChildScrollView(
            child: Text("""讨99""", style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
