

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

    Future<void> setImage(BuildContext context){
          return showDialog(context: context,builder: (BuildContext context){
            return AlertDialog(
              title: Text("Make A Choice"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                   
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: (){
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0),),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: (){
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ),);
          });
  }

  // Future getImage(isCamera) async {
  //   if(isCamera){
  //      image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   }else{
  //      image =await ImagePicker.pickImage(source: ImageSource.camera);
  //   }
    

  //   setState(() {
  //     _image = image;
  //   });
  // }

   Future _openGallery(BuildContext context) async{
    image =await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();

  }
  Future _openCamera( BuildContext context) async{
     image =await ImagePicker.pickImage(source: ImageSource.camera);
   setState(() {
      _image = image;
      print("hashika");
    });
    Navigator.of(context).pop();
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
      // _showonTapMessage(context, response.data);

      var state=response.data;
      getText=state;
      setState(() {
        getText=state;
      });
    } catch (err) {
      print(err.message);
    }
  }

//         void _showonTapMessage(BuildContext context, String message) {
//           var alert = new AlertDialog(
//             title: Text("Error",style: TextStyle(color: Colors.red),),
//             content: Text(message.toString()),
//             actions: <Widget>[
//                 FlatButton(
//                   child: Text("OK",style: TextStyle(color: Colors.green),),
//                   onPressed: () {
//                       Navigator.pop(context);
//                   }, )
//               ],
//           );
//  // showDialog(context: context, child: alert);
//   showDialog(context: context, builder: (context) => alert);
// }

    Widget _desideImageView(){
    if(_image == null)
      return null;
    else{
      return Image.file(_image,width:400,height:100);
    }
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
             _desideImageView(),
        // _image == null ? Text('No image selected.') :_desideImageView,

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
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               Align(
                  alignment:Alignment.centerLeft ,
                  child: Container(
                    child:Column(
                      children: <Widget>[
                          Align(
                             alignment: Alignment.centerLeft,
                              child: Text(getText,
                              style: TextStyle(
                                color: Colors.blueGrey,fontSize: 18.0
                              ),
                              ),
                          )
                      ],
                    ) ,),
               )
             ],
          )
        ],
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          setImage(context);
          },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      
    );
  }
}