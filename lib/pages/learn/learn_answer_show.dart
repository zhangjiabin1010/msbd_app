
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:msbd_app/models/ms_answer_entity.dart';
import 'package:msbd_app/pages/widgets/toastTip.dart';
import 'package:msbd_app/services/http.dart';
import 'package:fluttertoast/fluttertoast.dart';




class AnswerShow extends StatefulWidget {
  final int id;
  const AnswerShow({Key? key,required this.id}) : super(key: key);

  @override
  _AnswerShowState createState() => _AnswerShowState();
}

class _AnswerShowState extends State<AnswerShow> {

  late int _id;

  late Future<Data> futureAnswer;

  Future<Data> getAnswer(id) async {
    var response = await Http.getRes('ms_qa_query', params: {"id": id});
    Data Answer = Data.fromJson(response.data["data"]);
    return Answer;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget.id;
    futureAnswer = getAnswer(_id);
  }

  void previousQuestion(id) {
    // reload
    setState(() {
      futureAnswer = getAnswer(id-1);
    });
  }

  void nextQuestion(id) {
    // reload
    setState(() {
      futureAnswer = getAnswer(id+1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureAnswer,
        builder: (context, AsyncSnapshot<Data> snapshot) {
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
                Data? answer = snapshot.data;
                return Scaffold(
                    appBar: AppBar(title: Text("${answer?.question}"),),
                    body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: SingleChildScrollView(
                                child: Html(
                                  data: answer?.answer,
                                  // style: {
                                  //   "p": Style(
                                  //     color: Colors.green,
                                  //   )},
                                ),
                              ),
                            ),
                          )
                        ]),
                    bottomSheet: Container(
                      height: 90,
                      // decoration: BoxDecoration(border: ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(child:FavoriteIcon(id:answer?.id)
                          ),
                          Expanded(child:IconButton(
                            icon:Icon(Icons.chevron_left),
                            onPressed: (){
                              if(answer!.id > 1){
                                previousQuestion(answer.id);
                              }
                              else{
                                Fluttertoast.showToast(
                                    msg: "前面没有了",
                                    gravity: ToastGravity.CENTER,
                                    webPosition: "center",
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueGrey,
                                    textColor: Colors.white,
                                    fontSize: 14.0);
                              }
                            },
                          )
                          ),
                          Expanded(child:IconButton(
                            icon:Icon(Icons.chevron_right),
                            onPressed: (){
                              nextQuestion(answer?.id);
                            })
                          ),
                        ],
                      ),
                    )
                );
              }
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }


}





class FavoriteIcon extends StatefulWidget {
  final int? id;
  const FavoriteIcon({Key? key,this.id}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  //在这里根据id查询用户是否收藏了该文章
  bool selectedStatus = false;

  @override
  Widget build(BuildContext context) {
    String msg = selectedStatus ? "已取消收藏" : "已收藏~";

    Color iconColor = selectedStatus? Colors.deepOrange:Colors.grey;
    // String msg = "";

    return IconButton(icon:Icon(Icons.star,color: iconColor,),onPressed:(){
      setState(() {
        selectedStatus = !selectedStatus;
      });
      ShowToast(msg);

    });
  }
}

