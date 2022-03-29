import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonNameInfo extends StatefulWidget {
  const PersonNameInfo({Key? key}) : super(key: key);

  @override
  _PersonNameInfoState createState() => _PersonNameInfoState();
}

class _PersonNameInfoState extends State<PersonNameInfo> {
  bool login_status = false;
  // late String username;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    bool isLogined = prefs.getBool("isLogined") ?? false;
    // String user = prefs.getString("username") ?? "";
    setState(() {
      login_status = isLogined;
      // username = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("LLLLLLLLLLLLLLLLLLLL");
    print(login_status);
    // print(username);
    print("LLLLLLLLLLLLLLLLLLLL");

    if (login_status) {
      return UserInfo();
    } else {
      return RightAwayLogin();
    }
  }
}

Widget RightAwayLogin() {
  return Text("立即登录", style: TextStyle(fontSize: 20));
}

Widget UserInfo() {
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.grey,
      ),
    ]),
    child: Row(
      children: [
        PersonDetailTx(),
        Expanded(
            child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text("嫩娘了个腿儿", style: TextStyle(fontSize: 20)),
              Text("积分: 0", style: TextStyle(fontSize: 10, color: Colors.grey))
            ])),
        IconButton(
            onPressed: () {
              // Navigator.of(context).push(new MaterialPageRoute(
              //   builder: (BuildContext context) => PersonLogin(),
              // ));
            },
            icon: Icon(Icons.chevron_right))
      ],
    ),
  );
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
          height: 120,
        ),
        Positioned(
          top: 15.0,
          bottom: 15.0,
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
