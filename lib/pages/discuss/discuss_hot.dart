import 'package:flutter/material.dart';
import 'package:msbd_app/pages/discuss/discuss_article.dart';
import 'package:msbd_app/providers/discuss_logic.dart';
import 'package:provider/provider.dart';



class DiscussHotArticle extends StatelessWidget {
  const DiscussHotArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(child:
      // FutureProvider(
      //   initialData: null,
      //   create: (context) => _getArticleListData(context),
      //   child: const ArticleList(),
      // )
      // ChangeNotifierProvider(
      //   create: (context) => ArticleModel(),
      //   child: const ArticleList(),
      //   )
    // );
    return Container(
        margin: EdgeInsets.only(top:10),
        child: ArticleList()
    );
  }
}



