import 'package:flutter/material.dart';
import 'package:msbd_app/pages/widgets/toastTip.dart';

class PersonLogin extends StatefulWidget {
  const PersonLogin({Key? key}) : super(key: key);

  @override
  _PersonLoginState createState() => _PersonLoginState();
}

class _PersonLoginState extends State<PersonLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录"), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.tight(Size(double.infinity, 400)),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 80),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "请输入用户名";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          filled: true, // 不然 fillColor 等 不生效

                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.5), // 边框颜色
                            ),
                          ),
                          hintText: '请输入帐号',
                          icon: new Icon(
                            Icons.email,
                            color: Colors.grey,
                          )),
                    ),
                    Expanded(
                        child: TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "请输入用户名";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入密码',
                          icon: new Icon(
                            Icons.lock,
                            color: Colors.grey,
                          )),
                    )),
                  ],
                ),
              ),
            )),
            Container(
              child: TextButton(
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, minimumSize: Size(150, 30)),
                onPressed: () {
                  print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                  print(_formKey.currentState?.validate());
                  print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
