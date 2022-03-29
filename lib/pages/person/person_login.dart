import 'package:flutter/material.dart';
import 'package:msbd_app/pages/widgets/toastTip.dart';
import 'package:msbd_app/services/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PersonLogin extends StatefulWidget {
  const PersonLogin({Key? key}) : super(key: key);

  @override
  _PersonLoginState createState() => _PersonLoginState();
}

class _PersonLoginState extends State<PersonLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录"), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.tight(Size(double.infinity, 300)),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 80),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入账号';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5.0), //内边距设置
                          filled: true, // 不然 fillColor 等 不生效
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue, // 边框颜色
                            ),
                          ),
                          hintText: '请输入帐号',
                          icon: new Icon(
                            Icons.email,
                            color: Colors.grey,
                          )),
                      onSaved: (value){
                        username = value!;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                    ),
                    Expanded(
                        child: TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入密码';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5.0), //内边距设置
                          filled: true, // 不然 fillColor 等 不生效
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red, // 边框颜色
                            ),
                          ),
                          hintText: '请输入密码',
                          icon: new Icon(
                            Icons.lock,
                            color: Colors.grey,
                          )),
                      onSaved: (value){
                        password = value!;
                      },
                    )),
                  ],
                ),
              ),
            )),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text(
                        '注册',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          minimumSize: Size(100, 30)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          String returnMsg = await register(username,password);
                          ShowToast(returnMsg);
                        }
                        else{
                          WarnToast("输入内容不完整,请检查");
                        }

                      },
                    ),
                    TextButton(
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(100, 30)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          var returnMsg = await userLogin(username,password);
                          ShowToast(returnMsg);
                        }
                        else{
                          WarnToast("输入内容不完整,请检查");
                        }
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  register(username,password) async{
    var response = await Http.postRes('register', params: {"username":username,"password":password});
    var data = json.decode(response.toString());
    return data['msg'];
  }

  userLogin(username,password) async{
    var response = await Http.postRes('login', params: {"username":username,"password":password});

    var data = json.decode(response.toString());
    if (data['status']){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogined", true);
      prefs.setString("username", username);
    }
    return data['msg'];
  }

}
