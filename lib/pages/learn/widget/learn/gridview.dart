import 'package:flutter/material.dart';

class SelectGridView extends StatelessWidget {
  const SelectGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> titleList = ["热榜", "收藏", "题库", "已完成"];
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
              return GetGridView(titleList[index], imageList[index]);
            }),
          )),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 5.0)),
          height: 200,
          child: InkWell(
            onTap: () {},
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

Widget GetGridView(title, image) {
  return InkWell(
    onTap: () {},
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
