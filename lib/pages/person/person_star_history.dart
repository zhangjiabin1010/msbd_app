
import 'package:flutter/material.dart';

class PersonInfoBtn extends StatelessWidget {
  const PersonInfoBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: Colors.white24,
                    width: 2))),
        child: Row(
          children: [
            //收藏按钮
            Expanded(child:
              InkWell(
                onTap: (){print("xxxxxxxxxxxxxxx");},
                child:Column(
                  children: [
                    Icon(Icons.star_outline_outlined, color:Colors.blue),
                    Text("收藏",style: TextStyle(color:Colors.black,fontSize: 15),),
                  ]
                )
              )
            ),
            //帖子
            Expanded(child:
              InkWell(
                onTap: (){print("xxxxxxxxxxxxxxx");},
                child:Column(
                  children: [
                    Icon(Icons.article_outlined, color:Colors.blue),
                    Text("帖子",style: TextStyle(color:Colors.black,fontSize: 15),)
                  ]
                )
              )
            ),
            //关注
            Expanded(child: InkWell(
              onTap: (){print("xxxxxxxxxxxxxxx");},
              child:Column(
                  children: [
                    Icon(Icons.favorite_border_outlined, color:Colors.blue),
                    Text("关注",style: TextStyle(color:Colors.black,fontSize: 15),),
                  ]
                )
              )
            ),
            //消息
            Expanded(child:  InkWell(
              onTap: (){print("xxxxxxxxxxxxxxx");},
              child:Column(
                children: [
                  Icon(Icons.email_outlined, color:Colors.blue),
                  Text("消息",style: TextStyle(color:Colors.black,fontSize: 15),)
                ]
                )
              )
            )
          ],));
  }
}
