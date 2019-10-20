import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: new Home(),
    );
  }
}
