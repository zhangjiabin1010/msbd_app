import 'package:flutter/material.dart';

class FocusItemList extends StatelessWidget {
  const FocusItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> languagelist = ["Python", "Java", "Go"];
    const List<String> taglist = ["Vue", "React", "Springboot"];
    return Scaffold(
      appBar: AppBar(title: Text("选择学习技能"), centerTitle: true),
      body: Column(children: [
        ExpansionTile(
            title: Text('语言'),
            leading: Icon(Icons.ac_unit, color: Colors.green),
            backgroundColor: Colors.white,
            initiallyExpanded: true, // 是否默认展开
            children: List<Widget>.generate(languagelist.length, (index) {
              return ListTileItem(language: languagelist[index]);
            })),
        ExpansionTile(
            title: Text('标签'),
            leading: Icon(Icons.ac_unit, color: Colors.green),
            backgroundColor: Colors.white,
            initiallyExpanded: true, // 是否默认展开
            children: List<Widget>.generate(taglist.length, (index) {
              return ListTileItem(language: taglist[index]);
            }))
      ]),
    );
  }
}

class ListTileItem extends StatefulWidget {
  final String? language;

  const ListTileItem({Key? key, this.language}) : super(key: key);

  @override
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
      child: ListTile(
          title: Text("${widget.language}"),
          trailing: IconButton(
              icon: Icon(Icons.star,
                  color: isFavourite ? Colors.red : Colors.grey),
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              })),
    );
  }
}
