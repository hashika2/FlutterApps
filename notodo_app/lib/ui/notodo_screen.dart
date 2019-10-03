import 'package:flutter/material.dart';

class NotoDoScreen extends StatefulWidget {
  NotoDoScreen({Key key}) : super(key: key);

  _NotoDoScreenState createState() => _NotoDoScreenState();
}

class _NotoDoScreenState extends State<NotoDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black87,
     body: Column(),


     floatingActionButton: new FloatingActionButton(
       tooltip:"Add item",
       backgroundColor: Colors.redAccent,
       child: new ListTile(
         title: new Icon(Icons.add),
       ),
       onPressed: _showFormDiaog,
            ),
           );
         }
       
         void _showFormDiaog() {
  }
}