import 'package:flutter/material.dart';
import 'package:msbd_app/models/question_list_entity.dart';
import 'package:msbd_app/pages/learn/learn_answer_show.dart';
import 'package:msbd_app/pages/learn/learn_favorite_question_list.dart';
import 'package:msbd_app/pages/widgets/search_bar.dart';
import 'package:msbd_app/services/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';



class QuestionList extends StatelessWidget {
  final String? language;
  const QuestionList({Key? key,this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<Data>> future_qa;

    Future<List<Data>> getQuestionList() async {
      var response = await Http.getRes('ms_question_list_query',params: {"language":language});
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
                showSearch(context: context, delegate: SearchBarDelegate());},),
              IconButton(icon:Icon(Icons.folder_special,color: Colors.lightBlue,), tooltip: '收藏夹', onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>FavoriteQuestionList(),));
              },),
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
                            pushNewScreen(
                              context,
                              screen: AnswerShow(id:id),
                              withNavBar: false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                            // Navigator.of(context).push(new MaterialPageRoute(
                            //   builder: (BuildContext context) => AnswerShow(id:id),));
                          },
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("${item.id}.  ${item.question}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color: Colors.grey);
                      },
                      shrinkWrap: true)),
            );
  }




}

