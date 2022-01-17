import 'package:flutter/material.dart';

import 'collected.dart';
import 'finished.dart';
import 'focus.dart';
import 'hotlist.dart';
import 'widget/answer_detail.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      height: 1000,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red, width: 5.0)),
      child: Column(
        children: [SelectGridView()],
      ),
    );
  }
}

class SelectGridView extends StatelessWidget {
  const SelectGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> titleList = ["热榜", "收藏", "关注", "完成"];
    const List<String> imageList = [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png"
    ];
    return Column(children: [
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 5.0)),
          height: 500,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: 2,
                //纵轴间距
                mainAxisSpacing: 10.0,
                //横轴间距
                crossAxisSpacing: 10.0,
                //子组件宽高长度比例
                childAspectRatio: 1.4),
            children: List<Widget>.generate(titleList.length, (index) {
              return GetGridView(context, titleList[index], imageList[index]);
            }),
          )),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 5.0)),
          height: 200,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => AnswerShow()));
            },
            child: Card(
                elevation: 5.0, //设置阴影
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 100,
                  child: Text(
                    "开始学习",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                  ),
                )),
          ))
    ]);
  }
}

Widget GridRoute(title) {
  if (title == '关注') {
    return FocusItemList();
  } else if (title == '完成') {
    return FinishedList();
  } else if (title == '收藏') {
    return CollectedList();
  } else if (title == '热榜') {
    return HotList();
  } else {
    return HotList();
  }
}

Widget GetGridView(context, title, image) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => GridRoute(title)));
    },
    child: Card(
      elevation: 5.0, //设置阴影
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        children: [
          Expanded(
              child: Container(
            child: Image.asset(image),
            width: 50,
            height: 50,
          )),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 8),
                alignment: Alignment.center,
                child: Text(
                  "${title}",
                  style:
                      TextStyle(color: Colors.grey, fontSize: 18, height: 1.2),
                )),
          )
        ],
      ),
    ),
  );
}
