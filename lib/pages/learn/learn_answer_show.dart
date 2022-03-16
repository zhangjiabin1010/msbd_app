// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:msbd_app/models/ms_answer_entity.dart';
// import 'package:msbd_app/services/http.dart';
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:msbd_app/models/ms_answer_entity.dart';
import 'package:msbd_app/services/http.dart';




class AnswerShow extends StatelessWidget {
  final int? id;

  const AnswerShow({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<Data> futureAnswer;

    Future<Data> getAnswer() async {
      var response = await Http.getRes('ms_qa_query', params: {"id": id});
      Data Answer = Data.fromJson(response.data["data"]);
      return Answer;
    }

    futureAnswer = getAnswer();

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
                return buildScaffold(answer, getAnswer);
              }
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }

  Scaffold buildScaffold(Data? answer, Future<Data> getAnswer()) {
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
                        Expanded(child:IconButton(
                          icon:Icon(Icons.delete),
                          onPressed: (){
                            print("图标按钮");
                          },
                        )
                        ),
                        Expanded(child:IconButton(
                          icon:Icon(Icons.star),
                          onPressed: (){
                            print("图标按钮");
                          },
                        )
                        ),
                        Expanded(child:IconButton(
                          icon:Icon(Icons.chevron_left),
                          onPressed: (){
                            print("图标按钮");
                          },
                        )
                        ),
                        Expanded(child:IconButton(
                          icon:Icon(Icons.chevron_right),
                          onPressed: (){
                            getAnswer();
                            print("下一题");
                          },
                        )
                        ),
                      ],
                    ),
                  )
              );
  }

}



