import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msbd_app/pages/widgets/search_bar.dart';
import 'package:badges/badges.dart';

class DiscussAppBar extends StatelessWidget {
  const DiscussAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          width: 38,
          height: 38,
          child: CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(
                "https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500"),
          ),
        ),
        Expanded(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 32, maxWidth: 200),
                child: TextField(
                  textAlign: TextAlign.start,
                  readOnly: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 3.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      isDense: true,
                      // border: OutlineInputBorder(borderSide: BorderSide.none),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: '搜索关键字',
                      hintStyle:
                          TextStyle(fontSize: 15, color: Color(0xFF999999)),
                      prefixIcon: Icon(Icons.search)),
                  style: TextStyle(
                      fontSize: 15, color: Color(0xFF333333), height: 1.3),
                  textInputAction: TextInputAction.search,
                  onTap: () {
                    showSearch(context: context, delegate: SearchBarDelegate());
                  },
                ))),
        Container(
          margin: EdgeInsets.only(left: 15, right: 2, top: 3),
          child: Badge(
            shape: BadgeShape.square,
            showBadge: true,
            borderRadius: BorderRadius.circular(8),
            padding: EdgeInsetsDirectional.only(start: 7, end: 7),
            position: BadgePosition.bottomEnd(bottom: 18, end: -10),
            badgeColor: Colors.red,
            toAnimate: false,
            badgeContent: Text("99", style: TextStyle(color: Colors.white)),
            child: Icon(Icons.mail_outline_rounded,
                size: 33, color: Colors.grey[600]),
          ),
        ),
      ],
    ));
  }
}


