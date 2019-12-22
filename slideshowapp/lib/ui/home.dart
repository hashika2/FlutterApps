import 'package:flutter/material.dart';
import '../ui/login.dart';
import '../ui/myphoto.dart';
import '../ui/MyMap.dart';
import '../ui/mydetails.dart';

class Home extends StatefulWidget {
  Home({Key key, String title}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  login(){
    var route=new MaterialPageRoute(
      builder:(BuildContext context){
        return NextScreen2();
      } );
       Navigator.of(context).push(route);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title: new Text("Side bar Shower"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
        body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/img.jpeg',
            width: 370.0,
            height: 1100.0,
            fit: BoxFit.fill,// full size of the screen
            
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(height: 20.0,),
            new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed:login ,
                    child: Text("Login",style:TextStyle(backgroundColor: Colors.green,fontSize: 40.5,color: Colors.white),),
              ),
              SizedBox(height: 20.0,),
              Text("Welcome to Profile",style: TextStyle(color: Colors.white,fontSize: 25.5),)
                ],
              )
             
            )
            ],
          )
                     ]
                     ),
                       drawer:Drawer(
                     // Add a ListView to the drawer. This ensures the user can scroll
                     // through the options in the drawer if there isn't enough vertical
                     // space to fit everything.


                     child: ListView(
                       // Important: Remove any padding from the ListView.
                       padding: EdgeInsets.zero,
                       children: <Widget>[
                         UserAccountsDrawerHeader(
                            accountEmail: Text("m.g.hashikamaduranga"),
                            accountName: Text("Hashika Maduranga"),
                            currentAccountPicture: CircleAvatar(
                              backgroundColor:
                              Theme.of(context).platform == TargetPlatform.iOS
                                    ? Colors.blue
                                    : Colors.white,
                                    child:CircleAvatar(
                                    backgroundImage: ExactAssetImage('images/FACE.jpg'),
                                    minRadius: 90,
                                    maxRadius: 150,
                                  ),
                          ),
                         ),
                          new  Column(
                             children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.people),
                                      title: Text('MyDetails',style:TextStyle(color: Colors.black87,),),

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
                                   ],
                         ),
                          ListTile(
                            leading: Icon(Icons.perm_camera_mic),
                            title:Text("My Photos"),
                            onTap: (){
                              var router2=new MaterialPageRoute(
                                           builder: (BuildContext context){
                                             return NextScrean2();
                                             }
                                         ); 
                                          Navigator.of(context).push(router2);
                            } 
                          ),
                         ListTile(
                           leading: Icon(Icons.person_pin),
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
                            }
                                             ),
                       ListTile(
                            leading: Icon(Icons.map),
                            title:Text("My Map"),
                            onTap: (){
                              var router3=new MaterialPageRoute(
                                 builder: (BuildContext context){
                                     return MyMap();
                                 }
                              ); 
                                 Navigator.of(context).push(router3);
                            } 
                          ),
                            ],
                               ),
                                  ),
                                     );
                                   }
               _setDetails() {
                 setState(() {
                  var route=MaterialPageRoute(
                    builder:(BuildContext context){

                        return NextScrean();
                    } ) ;
                    Navigator.of(context).push(route);
                 });
               }
                    }
