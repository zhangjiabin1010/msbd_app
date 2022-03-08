import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msbd_app/models/article_entity.dart';
import 'package:msbd_app/services/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {


  List? articleListData;

  Future _getArticleList() async{
    await Http.get('article_query', params: {}, needCode: true).then((data) {
      setState((){
        articleListData = data["data"];
      });
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getArticleList();

  }

  @override
  Widget build(BuildContext context) {


    if (articleListData == null){
      return Scaffold(body: Center(
        child: CupertinoActivityIndicator(),
      ),);
    }
    ArticleListModel list = ArticleListModel.fromJson(articleListData!);
    var article = list.data;
    RefreshController _refreshController = RefreshController(initialRefresh: false);

    void _onRefresh() async{
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }



    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child:ListView.separated(
        itemCount: article.length,
        itemBuilder: (context,index){
          Data item = article[index];
          return ListTile(
              title: Text("${item.title}"),
              subtitle: Row(children:[
                Text("${item.author}"),
                Container(
                    margin:EdgeInsets.only(left: 20),
                    child: Text("${item.comment}")),
                Spacer(flex: 2),
                Container(
                  margin:EdgeInsets.only(right: 5),

                  alignment: Alignment.bottomRight,
                  // margin:EdgeInsets.only(left: 20),
                  child: Text("${item.createtime}"),)
              ]),
          );
        },
        separatorBuilder: (context,index){
          return Divider(color: Colors.purple);
        },
        shrinkWrap: true
        ))
    ;
  }
}

