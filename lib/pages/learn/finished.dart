import 'package:flutter/material.dart';

class FinishedList extends StatefulWidget {
  const FinishedList({Key? key}) : super(key: key);

  @override
  _FinishedListState createState() => _FinishedListState();
}

class _FinishedListState extends State<FinishedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("已完成"), centerTitle: true, actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: searchBarDelegate());
            }),
      ]),
      body: Column(children: []),
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
