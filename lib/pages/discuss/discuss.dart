import 'package:flutter/material.dart';
import 'package:msbd_app/services/http.dart';

class DiscussPage extends StatefulWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  _DiscussPageState createState() => _DiscussPageState();
}

class _DiscussPageState extends State<DiscussPage> {
  var data;

  void getHttp() async {
    try {
      Http.get('ms_question_show', params: {}, needCode: false).then((res) => {
            print('发送请求：$res'),
            setState(() {
              data = res;
            })
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(data[0]["question"]);
    var a = data[0]["question"];
    return Scaffold(
        appBar: AppBar(title: Text("ssss")),
        body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: SingleChildScrollView(
            child: Text("${a}", style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
