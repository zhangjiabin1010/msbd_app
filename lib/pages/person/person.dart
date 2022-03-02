import 'package:flutter/material.dart';
import 'package:msbd_app/pages/person/person_detail.dart';
import 'package:msbd_app/pages/person/person_more_setting.dart';
import 'package:msbd_app/pages/person/person_star_history.dart';

class PersonHomePage extends StatefulWidget {
  const PersonHomePage({Key? key}) : super(key: key);

  @override
  _PersonHomePageState createState() => _PersonHomePageState();
}

class _PersonHomePageState extends State<PersonHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(title:Text("个人中心"),centerTitle: true,),
      body: Container(child: Column(children: [
        PersonDetail(),
        PersonInfoBtn(),
        PersonMoreSetting()
        
      ],),),
    );
  }
}


