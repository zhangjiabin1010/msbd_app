// ignore_for_file: camel_case_types
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:msbd_app/pages/discuss/discuss.dart';
import 'package:msbd_app/pages/home/home.dart';
import 'package:msbd_app/pages/learn/learn.dart';
import 'package:msbd_app/pages/person/person.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    // BottomNavigationBarItem(
    //   backgroundColor: Colors.blue,
    //   icon: Icon(Icons.home),
    //   label: "首页",
    // ),


    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.local_library),
      label: "学习",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.question_answer),
      label: "讨论",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      label: "我",
    ),
  ];

  // final pages = [HomePage(), LearnPage(), DiscussPage(), PersonHomePage()];
  final pages = [ LearnPage(), DiscussPage(), PersonHomePage()];

  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Color(0x44000000),
      //   title: Text("底部导航栏"),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  _changePage(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
