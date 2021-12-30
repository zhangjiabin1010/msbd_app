import 'package:flutter/material.dart';

class SelectGridView extends StatelessWidget {
  const SelectGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
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
        children: getGridItem(),
      ),
    ));
  }
}

Widget getGridItem() {
  return InkWell(
    onTap: () {},
    child: Card(
      elevation: 1.0, //设置阴影
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                child: Image.asset("images/无法上网.png"),
                width: 50,
                height: 50,
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    child: Text(
                      "TTTTTTTTTTTTTTTTT",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18, height: 1.2),
                    )),
              )
            ],
          )
        ],
      ),
    ),
  );
}
