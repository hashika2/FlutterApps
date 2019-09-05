import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return new LoginState();
      }
    
    }
    
class LoginState extends State<Login>{
  final TextEditingController _userController=new TextEditingController();
  final TextEditingController _passwordController=new TextEditingController();
  String welcomName="!";
  String age;
  String universty="";
  String course="";
  String email="";
  String pnumber="";

  void _irase(){
    setState(() {
     _userController.clear();
     _passwordController.clear(); 
    });
  }
  void _welcomeShow(){
    setState(() {
      if(_userController.text=="hashika" && _passwordController.text=="12345"){
        welcomName=_userController.text;
        age="age is 23";
        universty="University of Kelaniya";
        course="Studing Softawre Engineering";
        email="email :m.g.hashikamaduranga@gmail.com";
        pnumber="0774164979";
      }
      else{
        welcomName="Enter correct username and Password!";
      }

    });
  }
   @override
     Widget build(BuildContext context) {
          
      return new Scaffold(
        appBar:new AppBar(
          title: new Text("Login"),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.blueGrey,

        body: new Container(
         
          alignment: Alignment.topCenter,
          child: new ListView(
            children: <Widget>[
              //set image
              new Image.asset(
                "images/face2.jpg",
                height:90.0,
                width:90.0
              ),
              new Container(
                 width: 380.0,
                 height: 180.0,
                 color: Colors.white,
                
                child:new Column(
                  children: <Widget>[
                    new TextField(
                  controller: _userController,
                  decoration: new InputDecoration(
                    hintText: "Username",
                    icon:new Icon(Icons.person),
                    
                  ),
                ),
                 new TextField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    icon:new Icon(Icons.lock),
                    
                  ),
                  obscureText: true, //dont show password
                ),
                new Padding(padding: new EdgeInsets.all(10.5),),//padding top
                new Center(
                  child: new Row(
                    children: <Widget>[

                      new Container(

                        margin: const EdgeInsets.only(left:16.7),//margin left
                        child: new RaisedButton(
                          onPressed: _welcomeShow,
                          color: Colors.redAccent,
                          child: new Text("login",
                          style:new TextStyle(color: Colors.white,
                          fontSize: 16.9)),
                        ),
                        
                        
                      ),
                      new Container(
                         
                          margin: const EdgeInsets.only(left: 120.6),
                          child: new RaisedButton(
                             onPressed:_irase,
                          color: Colors.redAccent,
                          child: new Text("Clear",
                          style:new TextStyle(color: Colors.white,
                          fontSize: 16.9)),
                          ),
                        )
                    ],
                  ),
                )
                  ],
                ),//form end here

               
                
              ),
              new Padding(
                padding :const EdgeInsets.all(10.45)),
               new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    new Text('Welcome $welcomName\n'
                              '$age\n'
                              '$universty\n'
                              '$course\n'
                              '$email\n'
                              '$pnumber\n',
                              
                    style:new TextStyle(
                      fontSize: 16.34,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),

                 
                  ],

                )

            ],
          ),
        ),
      );
        }
}