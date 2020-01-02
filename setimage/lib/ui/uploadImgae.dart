

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//import './config/config.dart' as config;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  String getText;
  bool isCamera=true;
  var image;

  Future getImage(isCamera) async {
    if(isCamera){
       image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }else{
       image =await ImagePicker.pickImage(source: ImageSource.camera);
    }
    

    setState(() {
      _image = image;
    });
  }

  upload() async {
    String fileName = _image.path;
    print(fileName);
    //String torken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hZHVzaGFua2FrYWhhd2FAZ21haWwuY29tIiwiX2lkIjoiNWUwZGNhYTZiODdkZTcwMDA0N2I5MDE2IiwiaWF0IjoxNTc3OTg0MDgzLCJleHAiOjE1Nzc5ODc2ODN9.hU-UXQLqU3ogPUXzM6skJXMwub5U42joIYs2bef_NLQ";

    try {
      FormData formData =
          new FormData.from({"image": new UploadFileInfo(_image, fileName)});
      var response =
          await Dio().post('http://192.168.8.103:5000/api/upload', data: formData);
      print(response.data);
       _showonTapMessage(context, response.data);

      var state=response.data;
      setState(() {
        getText=state;
      });
    } catch (err) {
      print(err.message);
    }
  }

        void _showonTapMessage(BuildContext context, String message) {
          var alert = new AlertDialog(
            title: Text("Error",style: TextStyle(color: Colors.red),),
            content: Text(message.toString()),
            actions: <Widget>[
                FlatButton(
                  child: Text("OK",style: TextStyle(color: Colors.green),),
                  onPressed: () {
                      Navigator.pop(context);
                  }, )
              ],
          );
 // showDialog(context: context, child: alert);
  showDialog(context: context, builder: (context) => alert);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Form(
          child: Column(
        children: <Widget>[
                    Padding(padding: EdgeInsets.only(top:10.0),),
          _image == null ? Text('No image selected.') :Image.file(_image,width:300.0,height:500.0),

          RaisedButton(
            child: Text("Upload"),
            onPressed:// _image != null ? upload :null ,
            (){
              if(_image!=null){
                upload();
                //_showonTapMessage(context, getText);
              }
            }
          ),
        ],
        
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          getImage(true);
          },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      
    );
  }
}