import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msbd_app/models/article_entity.dart';
import 'package:msbd_app/services/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleList extends StatefulWidget {
  final String? type;
  const ArticleList({Key? key, this.type}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late Future<List<Data>> future;

  Future<List<Data>> getArticleList() async {
    var response = await Http.getRes('article_query', params: {"type":widget.type});
    ArticleListModel articleList =
    ArticleListModel.fromJson(response.data["data"]);
    return articleList.data;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = getArticleList();

  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    future = getArticleList();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    future = getArticleList();
    print("onloading");
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    //   setState(() {
    //
    //   });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, AsyncSnapshot<List<Data>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print('还没有开始网络请求');
            return Text('还没有开始网络请求');
          case ConnectionState.active:
            print('active');
            return Text('ConnectionState.active');
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return buildSmartRefresher(snapshot);
            }
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  SmartRefresher buildSmartRefresher(AsyncSnapshot<List<Data>> snapshot) {
    return SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: WaterDropHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                // onLoading: _onLoading,

                child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Data item = snapshot.data![index];
                      return ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("${item.title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ),
                        subtitle: Row(children: [
                          Text("${item.author}"),
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("${item.comment}")),
                          Spacer(flex: 2),
                          Container(
                            margin: EdgeInsets.only(right: 5),

                            alignment: Alignment.bottomRight,
                            // margin:EdgeInsets.only(left: 20),
                            child: Text("${item.createtime}"),
                          )
                        ]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(color: Colors.purple);
                    },
                    shrinkWrap: true));
  }



}



class CategoryArticleList extends StatefulWidget {
  final String? type;
  const CategoryArticleList({Key? key,this.type}) : super(key: key);

  @override
  _CategoryArticleListState createState() => _CategoryArticleListState(this.type);
}

class _CategoryArticleListState extends State<CategoryArticleList> {

  _CategoryArticleListState(String? type);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ArticleList(type: widget.type,),
      )
    );
  }
}
