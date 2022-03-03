import 'package:flutter/material.dart';

class DiscussPage extends StatelessWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                pinned: true,
                floating: true,
                title: Text("搜索框"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  ),
                ],

                bottom: TabBar(
                  // indicator : BoxDecoration (color: Colors.lightBlue ),
                  indicatorColor: Colors.pink,
                  indicatorWeight: 2.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  // labelColor:Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: "热门"),
                    Tab(text: "分类"),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
            ],
          ),
        )));
  }
}


class SearchBarDelegate extends SearchDelegate<String> {
  // 搜索条右侧的按钮执行方法，我们在这里方法里放入一个clear图标。 当点击图片时，清空搜索的内容。
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        // 清空搜索内容
        query = "";
      },)
    ];
  }

  // 搜索栏左侧的图标和功能，点击时关闭整个搜索页面
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, "");
      },
    );
  }

  // 搜索到内容了
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text("搜索的结果：$query"),
      ),
    );
  }

  // 输入时的推荐及搜索结果
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentList : searchList.where((
        input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        // 创建一个富文本，匹配的内容特别显示
        return ListTile(title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0, query.length),
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
            )
          ],)),
          onTap: (){

          },
        );
      },
    );
  }
}

const searchList = [
  "搜索结果数据1-aa",
  "搜索结果数据2-bb",
  "搜索结果数据3-cc",
  "搜索结果数据4-dd",
  "搜索结果数据5-ee",
  "搜索结果数据6-ff",
  "搜索结果数据7-gg",
  "搜索结果数据8-hh"
];

const recentList = [
  "推荐结果1-ii",
  "推荐结果2-jj",
  "推荐结果3-kk",
  "推荐结果4-ll",
  "推荐结果5-mm",
  "推荐结果6-nn",
  "推荐结果7-oo",
  "推荐结果8-pp",
];