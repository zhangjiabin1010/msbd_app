import 'package:flutter/material.dart';


class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 2,
        itemBuilder: (context,index){
          return ListTile(
              title: Text("测测试测试测试测试测试测试测试测试测试测试测试测试测试试"),
              subtitle: Row(children:[
                Text("admin"),
                Container(
                    margin:EdgeInsets.only(left: 20),
                    child: Text("158评论")),
                Spacer(flex: 2),
                Container(
                  margin:EdgeInsets.only(right: 5),

                  alignment: Alignment.bottomRight,
                  // margin:EdgeInsets.only(left: 20),
                  child: Text("2020-05-12 20:00"),)

              ]),
          );
        },
        separatorBuilder: (context,index){
          return Divider(color: Colors.purple);
        },
        shrinkWrap: true
        );
  }
}
