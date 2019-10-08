import 'package:flutter/material.dart';
import 'package:slideshowapp/ui/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}



