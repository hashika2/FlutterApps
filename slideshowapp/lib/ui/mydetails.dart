import 'package:flutter/material.dart';
class NextScrean extends StatefulWidget {
  final String name;
  NextScrean({Key key,this.name}) : super(key: key);

  _NextScreanState createState() => _NextScreanState();
}

class _NextScreanState extends State<NextScrean> {
  var _backTextFieldController=new TextEditingController();

  String welcomName="!";
  String age;
  String universty="";
  String course="";
  String email="";
  String pnumber="";




  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("My Details"),
        
        centerTitle: true,
      ),
      body:new Container(
        
        width: 380.0,
        height: 300.0,
        color: Colors.blueGrey,
        margin: const EdgeInsets.all(10.4),
        alignment: Alignment.center,
        child:new Column(
         
         
          children: <Widget>[
             new Image.asset('images/FACE.jpg, ',width: 10.0,height: 10.0,),
             new Container(
               child: new ListTile(
                title: new Text('23 Years Old\n\n'
                              'University Of Kelaniya\n\n'
                              'Studing Software Engineering\n\n'
                              'm.g.hashikamaduranga@gmail.com\n\n'
                              '0774164979\n',
                              style: new TextStyle(color: Colors.pinkAccent,fontSize: 20.0
                                                   ),
                                                   
                              ),
                              
                              
      ),
             )
      
          ],
        )
        
      
      )
      
      );
      
  }
}
