import 'package:flutter/material.dart';
import 'package:msbd_app/models/ms_question_entity.dart';
import 'package:msbd_app/pages/widgets/button_icon_text.dart';
import 'package:msbd_app/pages/widgets/image_text_mix_generate.dart';
import 'package:msbd_app/services/http.dart';

class AnswerShow extends StatefulWidget {
  const AnswerShow({Key? key}) : super(key: key);

  @override
  _AnswerShowState createState() => _AnswerShowState();
}

class _AnswerShowState extends State<AnswerShow> {
  var Answer = {
    "id": "1",
    "title": "Python如何实现单例模式",
    "content": "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊|assets/images/1.png|嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿"
  };
  // var Answer = {};

  void getHttp() async {
    try {
      Http.get('ms_answer_show', params: {}, needCode: false).then((res) => {
            setState(() {
              print('1111111111111111111');
              print(res);
              print('1111111111111111111');
              Data answer = Data.fromJson(res);
              print('22222222222222222');
              print(answer);
              print('22222222222222222');
              // Answer = res;
            })
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    getHttp();
    super.initState();
  }

  void refresh_answer() {
    setState(() {
      Answer = {
        "id": "2",
        "title": "Pythonasdasdasdasd模式",
        "content": "嘿嘿嘿嘿嘿嘿嘿啊啊啊啊啊啊啊啊|assets/images/1.png|嘿嘿嘿嘿嘿嘿嘿嘿啊啊啊啊啊啊啊"
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print('xxxxxxxxxxxxxxxxxxxxxxxxx');
    print('xxxxxxxxxxxxxxxxxxxxxxxxx');
    print(Answer);
    print('xxxxxxxxxxxxxxxxxxxxxxxxx');
    print('xxxxxxxxxxxxxxxxxxxxxxxxx');
    var question_id = Answer['id'];
    var title = Answer['title'];
    List<String> AnswerItemList = Answer['content']!.split("|");
    return Scaffold(
        appBar: AppBar(
          title: Text("888888"),
        ),
        drawer: DrawerQuestionList(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Row(children: [
                Text(
                  "${title}",
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
                child: Text.rich(TextSpan(
                    children: List<InlineSpan>.generate(AnswerItemList.length,
                        (index) {
                  return ImageTextMixGenerate(context, AnswerItemList[index]);
                }))),
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
                  ButtonIconText(
                      question_id: question_id,
                      custom_icon: Icons.ac_unit_outlined,
                      custom_text: "收藏",
                      refresh_answer: refresh_answer),
                  ButtonIconText(
                      question_id: question_id,
                      custom_icon: Icons.add_chart,
                      custom_text: "会了",
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
