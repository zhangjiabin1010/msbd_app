// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:msbd_app/pages/learn/learn_answer_show.dart';
import 'pages/navigator/index_page.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(
  // MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (_) => AnswerModel()),
  //   ],
  //   child: const MyApp(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'msbd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black)),
      home: IndexPage(),
    );
  }
}
