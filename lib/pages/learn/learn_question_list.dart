import 'package:flutter/material.dart';
import 'package:msbd_app/models/question_list_entity.dart';
import 'package:msbd_app/pages/widgets/search_bar.dart';
import 'package:msbd_app/services/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



class QuestionList extends StatelessWidget {
  final String? language;
  const QuestionList({Key? key,this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<Data>> future_qa;

    Future<List<Data>> getQuestionList() async {
      var response = await Http.getRes('ms_question_list_query',params: {});
      print(response);
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
                          return ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("${item.title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(color: Colors.purple);
                        },
                        shrinkWrap: true)),
              );
            }
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    ));
  }




}


// class QuestionList extends StatefulWidget {
//   const QuestionList({Key? key}) : super(key: key);
//
//   @override
//   _QuestionListState createState() => _QuestionListState();
//
// }
//
// class _QuestionListState extends State<QuestionList> {
//   late Future<List<Data>> future_qa;
//
//   Future<List<Data>> getQuestionList() async {
//     var response = await Http.getRes('ms_question_list_query',params: {});
//     print(response);
//     QuestionListModel QuestionList = QuestionListModel.fromJson(response.data["data"]);
//     return QuestionList.data;
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     future_qa = getQuestionList();
//
//   }
//
//   RefreshController _refreshController = RefreshController(initialRefresh: false);
//   void _onRefresh() async {
//     future_qa = getQuestionList();
//     _refreshController.refreshCompleted();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: future_qa,
//       builder: (context, AsyncSnapshot<List<Data>> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//             print('还没有开始网络请求');
//             return Text('还没有开始网络请求');
//           case ConnectionState.active:
//             print('active');
//             return Text('ConnectionState.active');
//           case ConnectionState.waiting:
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           case ConnectionState.done:
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return buildSmartRefresher(snapshot);
//             }
//           default:
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//         }
//       },
//     );
//   }
//
//   Container buildSmartRefresher(AsyncSnapshot<List<Data>> snapshot) {
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       child: SmartRefresher(
//           enablePullDown: true,
//           enablePullUp: false,
//           header: WaterDropHeader(),
//           controller: _refreshController,
//           onRefresh: _onRefresh,
//           // onLoading: _onLoading,
//
//           child: ListView.separated(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 Data item = snapshot.data![index];
//                 return ListTile(
//                   title: Padding(
//                     padding: EdgeInsets.only(bottom: 10),
//                     child: Text("${item.title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Divider(color: Colors.purple);
//               },
//               shrinkWrap: true)),
//     );
//   }
//
// }
