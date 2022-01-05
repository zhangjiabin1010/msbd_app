import 'package:flutter/material.dart';

class FocusItemList extends StatelessWidget {
  const FocusItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("选择学习技能"), centerTitle: true),
        body: Column(
          children: List<Widget>.generate(1, (index) {
            return SelectItemList();
          }),
        ));
  }
}

class SelectItemList extends StatefulWidget {
  const SelectItemList({Key? key}) : super(key: key);

  @override
  _SelectItemListState createState() => _SelectItemListState();
}

class _SelectItemListState extends State<SelectItemList> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text('基础'),
        leading: Icon(Icons.ac_unit, color: Colors.green),
        backgroundColor: Colors.white,
        initiallyExpanded: true, // 是否默认展开
        children: List<Widget>.generate(1, (index) {
          return ListTileItem();
        }));
  }
}

class ListTileItem extends StatefulWidget {
  const ListTileItem({Key? key}) : super(key: key);

  @override
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
          title: Text('测试'),
          trailing: IconButton(
              icon: Icon(Icons.star,
                  color: isFavourite ? Colors.red : Colors.grey),
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
                print('secondAction');
              })),
    );
  }
}
//appbar,选择关注技能


//语言（java-python-xxx）


//其他 (算法-数据结构-网络-中间件-系统架构-

//redis-elasticsearch-docker-k8s)
// 开发经验，项目描述//常见问题