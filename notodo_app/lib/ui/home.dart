import 'package:flutter/material.dart';

import 'notodo_screen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title: Text("NoToDo"),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ) ,
      body: new NotoDoScreen(),

      );
  }
}