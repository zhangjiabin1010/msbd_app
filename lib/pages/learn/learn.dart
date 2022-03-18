import 'package:flutter/material.dart';
import 'package:msbd_app/pages/learn/learn_question_list.dart';



class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> languageList = [
      {
        "name": "java",
        "leadingIcon": Icon(
          IconData(
            0xe639,
            fontFamily: "Alibaba",
          ),
          color: Colors.red,
        )
      },
      {
        "name": "前端",
        "leadingIcon":
        Icon(IconData(0xe606, fontFamily: "Alibaba"), color: Colors.green)
      },
      {
        "name": "Python",
        "leadingIcon": Icon(IconData(0xe690, fontFamily: "Alibaba"),
            color: Colors.pinkAccent)
      },
      {
        "name": "Php",
        "leadingIcon":
        Icon(IconData(0xe67e, fontFamily: "Alibaba"), color: Colors.blue)
      },
      {
        "name": "Go",
        "leadingIcon":
        Icon(IconData(0xe61a, fontFamily: "Alibaba"), color: Colors.blue)
      },
      {
        "name": "Ruby",
        "leadingIcon":
        Icon(IconData(0xe68e, fontFamily: "Alibaba"), color: Colors.red)
      },
      {
        "name": "数据库",
        "leadingIcon": Icon(IconData(0xe620, fontFamily: "Alibaba"),
            color: Colors.tealAccent)
      },
      {
        "name": "容器构建",
        "leadingIcon":
        Icon(IconData(0xe8a3, fontFamily: "Alibaba"), color: Colors.cyan)
      },
      {
        "name": "架构设计",
        "leadingIcon":
        Icon(IconData(0xe632, fontFamily: "Alibaba"), color: Colors.orange)
      },
      {
        "name": "网络及安全",
        "leadingIcon": Icon(IconData(0xe752, fontFamily: "Alibaba"),
            color: Colors.redAccent)
      },
    ];


    return Scaffold(body: Container(child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("选择语言",
                style: TextStyle(color: Colors.red, fontSize: 17),
                textAlign: TextAlign.left)),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: languageList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: languageList[index]["leadingIcon"],
                    title: Text("${languageList[index]["name"]}"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap:(){
                      String language = languageList[index]["name"];
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => QuestionList(language:language),));


                    }
                );
              }),
        )
      ],
    ),),);
  }
}

