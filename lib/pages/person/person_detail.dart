import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msbd_app/pages/person/person.dart';
import 'package:msbd_app/pages/person/person_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PersonNameInfo extends StatefulWidget {
  const PersonNameInfo({Key? key}) : super(key: key);

  @override
  _PersonNameInfoState createState() => _PersonNameInfoState();
}

class _PersonNameInfoState extends State<PersonNameInfo> {
  bool login_status = false;
  String username = "";

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogined = prefs.getBool("isLogined") ?? false;
    String user = prefs.getString("username") ?? "";
    setState(() {
      login_status = isLogined;
      username = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (login_status) {
      return UserInfo(context, username);
    } else {
      return RightAwayLogin(context);
    }
  }

  Widget RightAwayLogin(context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextButton(
            child: Text(
              "立即登录",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => PersonLogin(),
              ));
            },
          ),
        ));
  }

  Widget UserInfo(context, username) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
          ),
        ]),
        child: Row(children: [
          PersonDetailTx(),
          Expanded(
              child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(username, style: TextStyle(fontSize: 20)),
                Text("积分: 0",
                    style: TextStyle(fontSize: 10, color: Colors.grey)),

              ])),
          IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Icon(Icons.logout),
                                title: new Text("退出登录",style: TextStyle(fontSize: 20),),
                                onTap: () async {
                                  SharedPreferences prefs =
                                  await SharedPreferences
                                      .getInstance();
                                  prefs.clear();
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PersonHomePage(),
                                      ));
                                })
                          ]);
                    });
              })
        ]));
  }
}

class PersonDetailTx extends StatelessWidget {
  const PersonDetailTx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 110,
        ),
        Positioned(
          top: 12.0,
          bottom: 12.0,
          child: CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                "https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500"),
          ),
        ),
      ],
    ));
  }
}
