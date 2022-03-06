import 'package:flutter/material.dart';
import 'package:msbd_app/pages/discuss/discuss_article.dart';

class DiscussHotArticle extends StatelessWidget {
  const DiscussHotArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top:10),
        child: ArticleList()
    );
  }
}


