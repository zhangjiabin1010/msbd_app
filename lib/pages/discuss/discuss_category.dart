import 'package:flutter/material.dart';
import 'package:msbd_app/pages/discuss/discuss_article.dart';

class DiscussCategory extends StatelessWidget {

  const DiscussCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> buttonList = [
      {"btnName":"职场","articleType":"workplace","icon":Icons.alarm},
      {"btnName":"技术","articleType":"technology","icon":Icons.aspect_ratio},
      {"btnName":"公司","articleType":"company","icon":Icons.contact_page},
      {"btnName":"问答","articleType":"question","icon":Icons.question_answer},
      {"btnName":"交易","articleType":"transaction","icon":Icons.question_answer},
      {"btnName":"新闻","articleType":"news","icon":Icons.question_answer},
      {"btnName":"投资","articleType":"invest","icon":Icons.question_answer},
      {"btnName":"趣事","articleType":"funny","icon":Icons.question_answer},
      {"btnName":"折扣","articleType":"discount","icon":Icons.question_answer},
    ];

    return Container(
        margin: EdgeInsets.only(top: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //横轴元素个数
          crossAxisCount: 4,
          //纵轴间距
          mainAxisSpacing: 3.0,
          //横轴间距
          crossAxisSpacing: 2.0,
          //子组件宽高长度比例
          childAspectRatio: 1.0),
          // shrinkWrap: true,
          itemCount: buttonList.length,
          itemBuilder: (BuildContext context, int index) {
            return buildGridBtn(context,buttonList[index]);
          },
    )
    );
  }

  InkWell buildGridBtn(context,Map<String, dynamic> btnItem) {
    return InkWell(
        // ArticleList(type: "hot",)
        onTap: (){
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => CategoryArticleList(type: btnItem["articleType"],)));
          },
        child:Center(
          child: Column(
              children: [
                Icon(btnItem["icon"], color:Colors.blue),
                Text("${btnItem["btnName"]}",
                  style: TextStyle(color:Colors.black,fontSize: 15),),
              ]
          ),
        )
    );
  }

}









