
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';// allows us to json objects into string so then we can desplay the data
import 'package:http/http.dart' as http;

void main() async{

  List _data=await getJson();
  String _body="";

  for(int i=0;i<_data.length;i++){
      print("title"+_data[i]['title']);
      print("body ${_data[i]['title']}");
  }
  _body=_data[0]['title'];

  

  runApp(new MaterialApp(
    home:new Scaffold(
      appBar: new AppBar(
        title: new Text("JASON setting"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _data.length,
          padding: const EdgeInsets.all(10.5),
          itemBuilder: (BuildContext context,int position){
            if(position.isOdd)return new Divider();// after every body status line occure

            final index=position ~/2;// we are dividing position by 2 and returning an integer result

            return new ListTile(
              title: new Text("${_data[index]['title']}",
              style: new TextStyle(fontSize: 18.9),),

              subtitle: new Text("${_data[index]['body']}",
              style: new TextStyle(fontSize: 14.5,
              fontStyle: FontStyle.italic),
              ),

              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Text("${_data[index]['title'][0].toString().toUpperCase()}",
                style:new TextStyle(fontSize: 13.7,
                color: Colors.deepOrange) ,
                ),

               
              ),
              onTap:() {_showOnMessage(context,"${_data[index]['title']}");}, 
              
            );
          },
        )
      ),
    )
  ));
}

void _showOnMessage(BuildContext context,String message){
  var alert=new AlertDialog(
    title: new Text("App"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);},
      child: new Text("OK"),)
    ],
  );
  showDialog(context: context,child: alert);

}

Future<List> getJson() async{
  String apiUrl="http://jsonplaceholder.typicode.com/posts";

  http.Response response=await http.get(apiUrl);
  return JSON.decode(response.body);//this is List
}