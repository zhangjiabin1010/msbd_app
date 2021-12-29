// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/navigator/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'msbd',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
