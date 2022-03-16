import 'package:flutter/material.dart';
import 'package:msbd_app/models/question_list_entity.dart';
import 'package:msbd_app/pages/learn/learn_answer_show.dart';
import 'package:msbd_app/pages/widgets/search_bar.dart';
import 'package:msbd_app/services/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';



class FavoriteQuestionList extends StatelessWidget {
  const FavoriteQuestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<Data>> future_qa;

    Future<List<Data>> getQuestionList() async {
      var response = await Http.getRes('ms_question_list_query',params: {"language":""});
      QuestionListModel QuestionList = QuestionListModel.fromJson(response.data["data"]);
      return QuestionList.data;
    }


    future_qa = getQuestionList();

    RefreshController _refreshController = RefreshController(initialRefresh: false);

    void _onRefresh() async {
      future_qa = getQuestionList();
      _refreshController.refreshCompleted();
    }

    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton (icon:Icon(Icons.search,color: Colors.lightBlue,), tooltip:'搜索',onPressed:(){
                showSearch(context: context, delegate: SearchBarDelegate());},)

            ]
        ),
        body:FutureBuilder(
          future: future_qa,
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
                  return buildContainer(_refreshController, _onRefresh, snapshot);
                }
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ));
  }

  Container buildContainer(RefreshController _refreshController, void _onRefresh(), AsyncSnapshot<List<Data>> snapshot) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SmartRefresher(
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
                int id = item.id;
                return ListTile(
                  onTap:(){
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => AnswerShow(id:id),));
                  },
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("${item.title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  ),
                  trailing: FavoriteIcon(id:id)
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.purple);
              },
              shrinkWrap: true)),
    );
  }
}


class FavoriteIcon extends StatefulWidget {
  final int? id;
  const FavoriteIcon({Key? key,this.id}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  Color iconColor = Colors.deepOrange;
  String msg = "";
  bool selectedStatus = true;
  @override
  Widget build(BuildContext context) {

    return IconButton(icon:Icon(Icons.star,color: iconColor,),onPressed:(){
      setState(() {
        print(selectedStatus);
        iconColor = selectedStatus ? Colors.grey : Colors.deepOrange;
        msg = selectedStatus ? "已取消收藏" : "收藏成功~";
        selectedStatus = selectedStatus ? false : true;


      });
    Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
    webPosition: "center",
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.blueGrey,
    textColor: Colors.white,
    fontSize: 14.0);

    });
  }
}
