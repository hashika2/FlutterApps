import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, String title}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title: new Text("Side bar Shower"),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
         body: Center(child: Text('My Page!')),
          drawer: Drawer(
            
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
             ListTile(
               
              title: Text('MyDetails',style:TextStyle(color: Colors.black87),),
              

           onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
               
                
                             var router=new MaterialPageRoute(
                              builder: (BuildContext context){
                                
                                return NextScrean();
                              
                                }
                             
                              
                            );
                             
                            Navigator.of(context).push(router);
                            
                           
                           
                             
                          
               
              },
             ),
            ListTile(
              title: Text('login'),
               onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
               
                var router1=new MaterialPageRoute(
                  builder: (BuildContext context){
                    return NextScreen2();
                                      }
                                    );
                                                
                                                 
                                                Navigator.of(context).push(router1);
                                                
                                               
                                               
                                                 
                                              
                                   
                                  },
                                ),
                              ],
                            ),
                          ),
                        
                          
                          );
                      }
                    }
                    
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
                           
                            //_showonTapMessage(context,"Enter Correct Username or Password");
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
                   }

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
        backgroundColor: Colors.blueAccent,
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