import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  //print data
  var data= await readData();
  if(data!=null){
    String message=await readData();
    print(message);
    
  }
  runApp(new MaterialApp(
    title:'IO',
    home: new Home(),));
    }
    
    class Home extends StatefulWidget {
      Home({Key key}) : super(key: key);
    
      _HomeState createState() => _HomeState();
    }
    
    class _HomeState extends State<Home> {
      var _enterDataField=new TextEditingController();
      String _saveData="";

      @override
  void initState() {
  
    super.initState();
    _loadStateData();
  }
  _loadStateData() async{

    sharedPreferences preferences=await SharedPreference.getInstace();

    setState(() {
     _saveData=preferences.getString ("Data");
    });
  }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
           appBar: new AppBar(
             title: new Text('Read/Write'),
             centerTitle: true,
             backgroundColor: Colors.greenAccent,
           ),

           body: new Container(
             alignment: Alignment.topCenter,
             padding: const EdgeInsets.all(10.9),
             child: new ListTile(
              title: new TextField(
                 controller: _enterDataField,
                 decoration: new InputDecoration(
                   labelText: "Write Somthing"
                 ),
               ),
               subtitle:new FlatButton(
                 onPressed: (){
                   //save data
                   writeData(_enterDataField.text);
                 },
                 child: new Column(
                   children: <Widget>[
                     new Text("write some"),
                     Padding(padding: const EdgeInsets.all(14.5),),
                     new FutureBuilder(
                       future: readData(),
                       builder: (BuildContext context,AsyncSnapshot<String> data){
                         if(data.hasData !=null){
                           return new Text(
                             data.data.toString(),
                             style:new TextStyle(
                               color: Colors.blueAccent
                             )
                           );
                         }else{
                           return new Text("no data Saved");
                         }
                       },
                     )
                   ],
                 ),
               )

                 
               ),
             ),
           );
        
      }
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
    