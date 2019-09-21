import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(new MaterialApp(
    title:'IO',
    home: new Home(),));
    }
    
    class Home extends StatefulWidget {
      Home({Key key}) : super(key: key);
    
      _HomeState createState() => _HomeState();
    }
    
    class _HomeState extends State<Home> {
      @override
      Widget build(BuildContext context) {
        return Container(
           child: child,
        );
      }
    }