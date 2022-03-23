import 'package:flutter/material.dart';
import 'package:msbd_app/pages/widgets/toastTip.dart';





class PersonSuggestionPage extends StatefulWidget {
  const PersonSuggestionPage({Key? key}) : super(key: key);

  @override
  _PersonSuggestionPageState createState() => _PersonSuggestionPageState();
}

class _PersonSuggestionPageState extends State<PersonSuggestionPage> {
  TextEditingController editingController = new TextEditingController();//声明controller


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("反馈建议",style: TextStyle(fontSize: 17),)),
      body: Container(child:
      TextField(
        controller: editingController,//指定controller

        textInputAction: TextInputAction.go,
        autofocus:true,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '请在此写下您的反馈或建议，谢谢'
        ),
      )
      ),
      bottomSheet: ElevatedButton(onPressed: () {
        String _submitValue = editingController.text;
        print(_submitValue);
        if (_submitValue == null || _submitValue.isEmpty){
          ShowToast("请先输入内容后提交");
        } else{
          ShowToast("提交成功");
          setState(() {
            editingController.clear();
          });
        }
      },
          child: Text("提交"),
          style: ElevatedButton.styleFrom(padding:EdgeInsets.only(bottom: 20,top:20),minimumSize:Size.fromHeight(30))),
    );
  }
}
