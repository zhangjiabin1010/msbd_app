import 'package:flutter/material.dart';



class DiscussHotArticle extends StatelessWidget {
  const DiscussHotArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      FilterItem()
    ]));
  }
}


class FilterItem extends StatelessWidget {
  const FilterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color? defaultBtnColor = Colors.grey[700];
    TextStyle unSelectBtnStyle = TextStyle(color: Colors.grey[700]);
    TextStyle selectedBtnStyle = TextStyle(color: Colors.yellow);

    return Expanded(child: Row(
      children: [
        // Expanded(child:TextButton(onPressed: () {  }, child: Text("热门",style: TextStyle(color: defaultBtnColor),))),
        Expanded(child:TextButton(onPressed: () {  }, child: Text("热门",style: unSelectBtnStyle))),
        Expanded(child:TextButton(onPressed: () {  }, child: Text("最新",style: unSelectBtnStyle))),
        Expanded(child:TextButton(onPressed: () {  }, child: Text("新闻",style: unSelectBtnStyle))),
        Expanded(child:TextButton(onPressed: () {  }, child: Text("推荐",style: unSelectBtnStyle)))
      ],));
  }
}
