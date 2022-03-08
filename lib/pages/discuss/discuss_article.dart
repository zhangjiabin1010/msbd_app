import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msbd_app/models/article_entity.dart';
import 'package:msbd_app/services/http.dart';



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
    print(list.data[0].comment);


    return ListView.separated(
        itemCount: list.data.length,
        itemBuilder: (context,index){
          Data item = list.data[index];
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
        );
  }
}

