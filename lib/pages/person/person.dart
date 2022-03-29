import 'package:flutter/material.dart';
import 'package:msbd_app/pages/person/person_detail.dart';
import 'package:msbd_app/pages/person/person_more_setting.dart';
import 'package:msbd_app/pages/person/person_star_history.dart';



class PersonHomePage extends StatelessWidget {
  const PersonHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title:Text("个人中心"),centerTitle: true,),
      body: Container(child: Column(children: [
        PersonNameInfo(),
        PersonInfoBtn(),
        PersonMoreSetting()

      ],),),
    );
  }
}
