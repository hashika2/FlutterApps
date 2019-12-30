
import 'dart:async';
import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;





//import 'package:sky_engine/_http/http.dart' as http;

class PrfilePage extends StatefulWidget {
  PrfilePage({Key key}) : super(key: key);

  @override
  _PrfilePageState createState() => _PrfilePageState();
}

class _PrfilePageState extends State<PrfilePage> {
  //final GlobalKey<ScaffoldState>_snaffolderstate =new GlobalKey<ScaffoldState>();
  File tempFile;
  File f;
  Future<File> file;
  String status='';
  String base64Image;
  String errorMessage="uploading failed";
  static final String uploadEndPoint ='192.168.43.93:8080';

setStatus(error){
  setState(() {
    status=error;
  });
}
upload(File fileName)async{
    //String fileName=basename(fileName.path);
  try{
    
  FormData formData = new FormData.from({
     //"file":new UploadFileInfo(tempFile, fileName)
     "image":fileName,
     
  });
  var dio = Dio();
  print(formData);

 //formData.files.add(MapEntry("Picture", await MultipartFile.fromFile())
  // var response=await dio.post(uploadEndPoint,data:formData);
  // Response res=await http.post(uploadEndPoint,body:formData).then((result){
  //   print(result.body);
  // });/
  // var res= http.post(new Uri.http(uploadEndPoint,'/read'), body: formData);
  // print(res);
   var request = new http.MultipartRequest("POST", new Uri.http(uploadEndPoint, '/read'));
    request.files.add(new http.MultipartFile.fromBytes('image', await fileName.readAsBytes()));

    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });
  }catch(e){
    print('error'+e);
  }
 
 // Response response=await http.post(uploadEndPoint,formData);
}
  @override
  Widget build(BuildContext context) {

    
     chooseImage(){
      setState(() {
       file = ImagePicker.pickImage(source: ImageSource.gallery);
      
      });
    }
    startUpload(){
      setStatus('uploading Image...');
      if(tempFile==null){
      setStatus(errorMessage);
        return;
      
    }
    String fileN = tempFile.path.split('/').last;
    upload(tempFile);
    }

    Widget showImage(){
      return FutureBuilder<File>(
        future: file,
        builder: (BuildContext context,AsyncSnapshot<File> snapshot){
          if(snapshot.connectionState == ConnectionState.done &&
          null !=snapshot.data){ 
            tempFile=snapshot.data;
            base64Image = base64Encode(snapshot.data.readAsBytesSync());
            return Flexible(child: Image.file(
              snapshot.data,
              fit:BoxFit.fill,
            ),
            );
          }else if(null !=snapshot.error){
            return const Text(
              'error Picking Image',
              textAlign:TextAlign.center,
            );
          }else{
            return const Text(
              'no image selected',
              textAlign:TextAlign.center,
            );
          }
        }
        
      );
    }
    
    return Scaffold(
     
      appBar: AppBar(
      title: Text("upload Image"),

      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              onPressed: chooseImage,
              child: Text("Choose Image"),
              ),
              SizedBox(height: 20.0,),
             
              showImage(),
              SizedBox(height:20.0),
               OutlineButton(
                child:Text("upload Image") ,
                onPressed: startUpload,),
              Text(status,
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize:20.0
              ) ,)
          ],)

    )
    );
  }

}