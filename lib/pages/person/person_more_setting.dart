import 'package:flutter/material.dart';
import 'package:msbd_app/pages/person/person_suggestion_page.dart';



class PersonMoreSetting extends StatelessWidget {
  const PersonMoreSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child:Container(
      padding: EdgeInsets.all(20.0),
      child:ListView(
        children: [
          ListTile(
            title:Text("建议反馈"),
            leading: Icon(Icons.support_agent),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => PersonSuggestionPage(),));
            },
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title:Text("设置"),
            leading: Icon(Icons.settings),

            onTap: () {

            },
            trailing: Icon(Icons.chevron_right),
          )
        ],
      )
    )
    );
  }
}
