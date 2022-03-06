import 'package:flutter/material.dart';
import 'package:msbd_app/pages/discuss/discuss_appbar.dart';
import 'package:msbd_app/pages/discuss/discuss_category.dart';
import 'package:msbd_app/pages/discuss/discuss_hot.dart';
import 'package:msbd_app/pages/discuss/discuss_latest.dart';
import 'package:msbd_app/pages/discuss/discuss_recommend.dart';



class DiscussPage extends StatelessWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    pinned: true,
                    floating: true,
                    // 搜索栏
                    title: DiscussAppBar(),
                    // actions: <Widget>[],
                    bottom: TabBar(
                      // indicator : BoxDecoration (color: Colors.lightBlue ),
                      indicatorColor: Colors.pink,
                      labelColor: Colors.deepOrange,
                      indicatorWeight: 2.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      // labelColor:Colors.black,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: "热门"),
                        Tab(text: "推荐"),
                        Tab(text: "最新"),
                        Tab(text: "分类"),
                      ],
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: [
                  DiscussHotArticle(),
                  DiscussRecommend(),
                  DiscussLatest(),
                  DiscussCategory(),

                ],
              ),
            )));
  }
}
