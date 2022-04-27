import 'package:flutter/material.dart';
import 'package:list_training/animated_list/main_page.dart';
import 'package:list_training/my_graph/my_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:  MyGraph(),
    );
  }
}