import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _inputusercontroller =new TextEditingController();
  final TextEditingController _inpputpasswordcontroller =new TextEditingController();

  _login(){
    setState(() {
     print("hashika"); 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
         title: new Text("Login"),
         backgroundColor: Colors.greenAccent,
         centerTitle: true,

       ),
       body: Stack(
         alignment: Alignment.topCenter,
           children: <Widget>[
             new Center(
              child:new  Image.asset("images/img.jpeg",width: 479,height: 1100,fit: BoxFit.fill,),
             ),
               new Column(
                 
                 children: <Widget>[
                   new Padding(padding: const EdgeInsets.only(top: 20.0),),
                   Image.asset("images/face2.jpg",width:100,height: 100.0,)
                 ],
                 
               ),
             Container(   
               margin: const EdgeInsets.only(top: 350.0),
               width: 380.0,
               height: 180.0,
               color: Colors.tealAccent,
               child: Column(
                 children: <Widget>[

                    new TextField(
                    controller: _inputusercontroller ,
                    decoration: InputDecoration(
                      hintText: "Username",
                      icon: Icon(Icons.people)
                    ),
                  ),
                  new TextField(
                    controller: _inpputpasswordcontroller,
                    decoration: new InputDecoration(
                      hintText: "Password",
                      icon: Icon(Icons.person_pin)
                    ),
                  ),
                 
                  new Center(
                    child: Column(
                      children: <Widget>[
                         new Padding(padding:const EdgeInsets.all(10.5) ,),
                         new RaisedButton(
                          onPressed:_login(),
                          color: Colors.redAccent,
                          child: new Text("Login",style: TextStyle(color: Colors.white),),


                        )
                      ],
                    )
                  )
                 
                 ],
               )
              
               
               
              
             ),
             new Container(
               child: Stack(
                 
               )
             )
             
           ],
         ),
       
    );
  }
}