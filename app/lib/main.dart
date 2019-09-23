import "package:flutter/material.dart";
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(new MaterialApp(
    title:"Dayabase",
    home: new Home(),));
}
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      )
    );
  }
}