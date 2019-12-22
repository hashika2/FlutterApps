import 'package:flutter/material.dart';
import '../ui/mydetails.dart';
class NextScreen2 extends StatefulWidget {

                     
                     NextScreen2({Key key}) : super(key: key);
                   
                     _NextScreen2State createState() => _NextScreen2State();
                   }
                   
                   class _NextScreen2State extends State<NextScreen2> {
                     final TextEditingController _userController=new TextEditingController();
                     final TextEditingController _passwordController=new TextEditingController();
                     void _irase(){
                      setState(() {
                      _userController.clear();
                      _passwordController.clear(); 
                      });
  }
                     @override
                     Widget build(BuildContext context) {
                          return new Scaffold(
        appBar:new AppBar(
          title: new Text("Login"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,

        body: new Container(
         
          alignment: Alignment.topCenter,
          child: new ListView(
            children: <Widget>[
              //set image
              new Image.asset(
                "images/FACE.jpg",
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
                          onPressed: (){
                             if(_userController.text=="hashika" && _passwordController.text=="12345"){
                            var router=new MaterialPageRoute(
                              builder: (BuildContext context){
                                return NextScrean();
                                }
                            );
                            Navigator.of(context).push(router);
                             }else{
                            _showonTapMessage(context,"Enter Correct Username or Password");
                             }
                          },
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
                    new Text('Welcome',
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
        void _showonTapMessage(BuildContext context, String message) {
          var alert = new AlertDialog(
            title: Text("Error",style: TextStyle(color: Colors.red),),
            content: Text(message),
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
}