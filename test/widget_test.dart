import 'package:flutter/material.dart';
import 'package:msbd_app/pages/widgets/button_icon_text.dart';
import 'package:msbd_app/pages/widgets/image_text_mix_generate.dart';

class AnswerShow extends StatelessWidget {
  const AnswerShow({Key? key}) : super(key: key);
//这里需要获取随机问题，返回其中一个
  @override
  Widget build(BuildContext context) {
    print('请求数据');
    print("888888");
    const Answer = {
      "id": "1",
      "title": "Python如何实现单例模式",
      "content": "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊|assets/images/1.png|嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿"
    };
    var question_id = Answer['id'];
    var title = Answer['title'];
    List<String> AnswerItemList = Answer['content']!.split("|");
    // const AnswerItemList = [
    //   "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
    //   "assets/images/1.png",
    //   "嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿"
    // ];
    return Scaffold(
        appBar: AppBar(
          title: Text("888888"),
        ),
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
                      context, question_id, Icons.ac_unit_outlined, "收藏"),
                  ButtonIconText(context, question_id, Icons.add_chart, "会了"),
                  ButtonIconText(context, question_id, Icons.alarm_on, "下一题"),
                ])));
  }
}
