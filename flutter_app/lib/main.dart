import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home.dart';
import './ui/welcome_page.dart';

void main(){
  runApp(
      new MaterialApp(

        title:"Welcome App",
        home:new Welcome(),
      ));

   runApp(
     new MaterialApp(
     color:Colors.greenAccent,  
     title: "home",
     home:new Home(),)
   );   

}

