import 'package:flutter/material.dart';
import '../ui/mydetails.dart';
import '../ui/myphoto.dart';
import '../ui/login.dart';

class Drawer extends StatefulWidget {
  Drawer({Key key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                           ],
                                         ),
    );
  }
}
                   