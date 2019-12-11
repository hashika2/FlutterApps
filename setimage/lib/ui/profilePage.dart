import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class PrfilePage extends StatefulWidget {
  PrfilePage({Key key}) : super(key: key);

  @override
  _PrfilePageState createState() => _PrfilePageState();
}

class _PrfilePageState extends State<PrfilePage> {

  File _image;
  @override
  Widget build(BuildContext context) {

    Future getImage() async{
      var image = await ImagePicker.pickImage(source:ImageSource.gallery);

      setState(() {
        _image=image;
        print("image path $_image");
      });
    }
    Future uploadPic()async{
      String fileName =basename(_image.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask =firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot =await uploadTask.onComplete;

      setState(() {
        print("profile picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Uploaded'),));
      });
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft,),
          onPressed: (){
            Navigator.pop(context);
          },),
          title: Text("Edit Profile"),

      ),
      body: Builder(
        builder:(context)=> Container(
          child:Column(
            children: <Widget>[
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment:Alignment.center ,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xff476cfb),
                      child:ClipOval(
                        child:SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child:(_image!=null)?Image.file(_image,fit:BoxFit.fill):
                           Image.network(
                            "https://res.cloudinary.com/ufn/image/upload/c_pad,dpr_1.5,f_auto,fl_progressive,h_449,w_400/u7cdzxvxu69pmubmtltc.jpg",fit:BoxFit.fill
                          ),
                        ) 
                        ,)
                      ,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size:30.0,
                             ),
                             onPressed:(){
                               getImage();
                             },
                              
                        ),
                      ),
                ],
                      
                )
              ,
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment:Alignment.centerLeft ,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("username",
                              style: TextStyle(
                                color: Colors.blueGrey,fontSize: 18.0
                              ),
                              ),
                              ),
                               Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Michel James",
                              style: TextStyle(
                                color: Colors.black,fontSize: 18.0
                              ),
                              ),
                              ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.pen,
                                  color: Color(0xff476cfb),                             
                                ),),)

                          ],
                          )
                          ,),
                          )
                  ],
                  ),
                  SizedBox(
                    height: 20.0,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment:Alignment.centerLeft ,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("username",
                              style: TextStyle(
                                color: Colors.blueGrey,fontSize: 18.0
                              ),
                              ),
                              ),
                               Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Michel James",
                              style: TextStyle(
                                color: Colors.black,fontSize: 18.0
                              ),
                              ),
                              ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.pen,
                                  color: Color(0xff476cfb),
                                ),),)

                          ],
                          )
                          ,),
                          )
                  ],
                  ),
                    SizedBox(
                    height: 20.0,),
                           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment:Alignment.centerLeft ,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Email",
                              style: TextStyle(
                                color: Colors.blueGrey,fontSize: 18.0
                              ),
                              ),
                              ),
                               Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Michel @gmail.com",
                              style: TextStyle(
                                color: Colors.black,fontSize: 18.0
                              ),
                              ),
                              ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Icon(
                                  FontAwesomeIcons.pen,
                                  color: Color(0xff476cfb),                             
                                ),),)

                          ],
                          )
                          ,),
                          )
                  ],
                  ),
                  SizedBox(
                    height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white,fontSize: 16.0),
                          ),
                          ),
                          RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: (){
                            uploadPic();
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white,fontSize: 16.0),
                          ),
                          )
                      ],)
            ],
            )
       ) ,
       ),
    );
  }

}