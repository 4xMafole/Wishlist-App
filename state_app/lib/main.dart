import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code with Fox',
      home: HomeView(),
    );
  }
}
