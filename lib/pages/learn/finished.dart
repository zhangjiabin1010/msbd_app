import 'package:flutter/material.dart';

class FinishedList extends StatefulWidget {
  const FinishedList({Key? key}) : super(key: key);

  @override
  _FinishedListState createState() => _FinishedListState();
}

class _FinishedListState extends State<FinishedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("已完成"), centerTitle: true, actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('开始搜索');
            }),
      ]),
      body: Column(children: []),
    );
  }
}
