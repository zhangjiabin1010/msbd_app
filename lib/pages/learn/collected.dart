import 'package:flutter/material.dart';

import 'widget/question_list.dart';

class CollectedList extends StatefulWidget {
  const CollectedList({Key? key}) : super(key: key);

  @override
  _CollectedListState createState() => _CollectedListState();
}

class _CollectedListState extends State<CollectedList> {
  @override
  Widget build(BuildContext context) {
    const question_list = [
      {"id": "1", "title": "Python的浅拷贝与深拷贝区别"},
      {"id": "2", "title": "对GIL的理解"},
      {"id": "3", "title": "常见Web框架"},
    ];
    return Scaffold(
      appBar: AppBar(title: Text("收藏"), centerTitle: true, actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: searchBarDelegate());
            }),
      ]),
      body: RefreshIndicator(
        //圆圈进度颜色
        color: Colors.blue,
        //下拉停止的距离
        displacement: 44.0,
        //背景颜色
        backgroundColor: Colors.grey[200],
        onRefresh: () async {
          //模拟网络请求
          await Future.delayed(Duration(milliseconds: 2000));
          //结束刷新
          return Future.value(true);
        },
        //一个列表
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 2, color: Colors.grey);
          },
          itemBuilder: (BuildContext context, int index) {
            return QuestionListItem(question_list[index]);
          },
          //列表数据源数量
          itemCount: question_list.length,
        ),
      ),
    );
  }
}

class searchBarDelegate extends SearchDelegate<String> {
//重写右侧的图标
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        icon: Icon(Icons.clear),
        //将搜索内容置为空
        onPressed: () => query = "",
      )
    ];
  }

//重写返回图标
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        //关闭上下文，当前页面
        onPressed: () => close(context, ""));
  }

  //重写搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          // child: Text(query),
          child: Text("ssssssssssssssssssssss"),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    const recentSuggest = ["wangcai推荐-1", "nvfengsi推荐-2"];
    const searchList = ["wangcai", "xiaoxianrou", "dachangtui", "nvfengsi"];

    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ));
  }
}
