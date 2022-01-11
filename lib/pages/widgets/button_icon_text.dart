import 'package:flutter/material.dart';

Widget ButtonIconText(custom_icon, custom_text) {
  return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            Expanded(child: Icon(custom_icon)),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  child: Text(
                    "{$custom_text}",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, height: 1.2),
                  )),
            ),
          ],
        ),
      ));
}
