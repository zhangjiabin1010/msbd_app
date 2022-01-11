import 'package:flutter/material.dart';

class DiscussPage extends StatefulWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  _DiscussPageState createState() => _DiscussPageState();
}

class _DiscussPageState extends State<DiscussPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ssss")),
        body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Center(
            child: Text("""讨论ssssss讨论sssssss讨论sssssss讨论sssssss讨论
              sssssss讨论ssssss讨论ssssss讨论sssssss讨
              论sssssss讨论sssssss讨论ssssss
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论sssss讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论
              s讨论sssssss讨论sssssss讨论99999""", style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
