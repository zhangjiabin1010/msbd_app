import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:msbd_app/models/ms_answer_entity.dart';
import 'package:msbd_app/services/http.dart';






class AnswerShow extends StatefulWidget {
  const AnswerShow({Key? key}) : super(key: key);

  @override
  _AnswerShowState createState() => _AnswerShowState();
}

class _AnswerShowState extends State<AnswerShow> {
  String? answer;
  String? question;

  Future getAnswer() async {
    var response = await Http.get('servers_data_handle', params: {}, needCode: false).then((data){
      Data answer_data = Data.fromJson(data);
      setState(() {
        question = answer_data.question;
        answer = answer_data.answer;
      });
    });
    return response;
  }

  @override
  void initState() {
    super.initState();
    getAnswer();

  }

  @override
  Widget build(BuildContext context) {
    if (question == null){
      return Scaffold(body: Center(
        child: CupertinoActivityIndicator(),
      ),);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("${question}"),
        ),
        // drawer: DrawerQuestionList(),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SingleChildScrollView(
                    child: Html(
                      data: answer,
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
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
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
                print("图标按钮");
              },
            )
            ),
          ],
        ),
    ));
  }
}
