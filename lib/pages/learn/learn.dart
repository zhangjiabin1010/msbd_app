import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'collected.dart';
import 'finished.dart';
import 'focus.dart';
import 'hotlist.dart';
import 'answer_detail_show.dart';




class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child:
            Column(
                children: [SelectGridView(),StartLearnButton(context)],
       )
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
    return Expanded(child:Container(
            padding: EdgeInsets.only(top:130.0,left:20.0,right:20.0),
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
            // shrinkWrap: true,
            children: List<Widget>.generate(titleList.length, (index) {
              return GetGridView(context, titleList[index], imageList[index]);
            }),
          )
    ));
  }
}


Widget StartLearnButton(context){
  return Container(
    margin: EdgeInsets.only(bottom:150),
    padding: EdgeInsets.only(left: 50.0,right: 50.0),
    child: SizedBox(
      width: 280.0,
      height: 150.0,
      child: Card(
        elevation: 5.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: TextButton(
        onPressed:(){
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => AnswerShow()));
        },
        child:Text("开始",style: TextStyle(color: Colors.grey[800]),),
        style: ButtonStyle(
          textStyle:MaterialStateProperty.all(
            TextStyle(fontSize: 50)),
          // backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
      )
    )
  );
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

//四个选项卡的跳转逻辑
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