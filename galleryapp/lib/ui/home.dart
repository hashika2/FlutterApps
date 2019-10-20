import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  
 

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Future<void> _showChoiceDialog(BuildContext context){
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

 
   File imageFile;

  Widget _desideImageView(){
    if(imageFile == null)
      return Text("No Image Selected");
      else{
        return Image.file(imageFile,width:400,height:400);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Gallery"),
        centerTitle: true,

      ),
      backgroundColor: Colors.white38,
      body: new Container(
        child:Center(
           child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
             _desideImageView(),
            Text("Hello World"),
            RaisedButton(
              onPressed: (){
                _showChoiceDialog(context);
                              },
                              child: Text("select Image"),
                              )
                          ],
                        ),
                        )
                       
                      ),
                       
                    );
                  }

       
   
  _openGallery(BuildContext context) async{
    var picture =await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile =picture;
    });
    Navigator.of(context).pop();

  }
  _openCamera( BuildContext context) async{
     var picture =await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile =picture;
    });
    Navigator.of(context).pop();
  }
  

                
                 
}