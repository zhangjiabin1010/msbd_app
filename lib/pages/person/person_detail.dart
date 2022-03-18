
import 'package:flutter/material.dart';

class PersonNameInfo extends StatefulWidget {
  const PersonNameInfo({Key? key}) : super(key: key);

  @override
  _PersonNameInfoState createState() => _PersonNameInfoState();
}

class _PersonNameInfoState extends State<PersonNameInfo> {
  bool login_status = false;
  @override
  Widget build(BuildContext context) {
    if (login_status){
      return RightAwayLogin();
    }
    else{
      return NickName();
    }
  }
}



Widget RightAwayLogin(){
  return Expanded(child:
    Text("立即登录",style: TextStyle(fontSize:20),)
  );
}

Widget NickName(){
  return Expanded(child:
    Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text("嫩娘了个腿儿",style: TextStyle(fontSize:20)),
          Text("积分: 1000",style: TextStyle(fontSize:10,color:Colors.grey))
      ]
    )
  );
}


class PersonDetail extends StatelessWidget {
  const PersonDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
          ),
        ]),
        child: Row(
          children: [
            PersonDetailTx(),
            PersonNameInfo(),
            IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right))
        ],));
  }
}



class PersonDetailTx extends StatelessWidget {
  const PersonDetailTx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(height: 120, ),
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
    )
    );
  }
}





