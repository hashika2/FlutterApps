import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title: Text("NoToDo"),
        backgroundColor: Colors.black54,
      ) ,);
  }
}