import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
           
        );
      }

      Future<String> get _localPath async{
        final directory=await getApplicationDocumentsDirectory();
         return directory.path;//home.directory
      }
      Future <File> get _localFile async{
         final path=await _localPath;

         return new File('$path/data.txt');//home/directory/data.txt
      }

      //write and read from our file

      Future<File> writeData(String message) async
      {
        final file=await _localFile;

        //write to file4
        return file.writeAsString('$message');
      }

      Future<String> readData() async{
        try{
          final file=await _localFile;

          //read
          String data=await file.readAsString();
          return data;
        }
        catch (e){
          return e;
        }
      }
    }