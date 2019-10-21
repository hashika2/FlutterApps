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
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
        body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/FACE.jpg',
            width: 370.0,
            height: 1100.0,
            fit: BoxFit.fill,// full size of the screen
            ),
            // new RaisedButton(
          //    onPressed: _setDetails(),
          //                textColor: Colors.blueGrey,
          //                child: new Text("Add Details"),
          //              )
          ),
          
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
                         DrawerHeader(
                           child: Text('MY FROFILE'),
                           decoration: BoxDecoration(
                             color: Colors.blueAccent,
                           ),
                         ),
                        
                                 new  Column(
                                   children: <Widget>[
                                   new  Icon(Icons.people),
                                        ListTile(
             
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

class NextScrean2 extends StatefulWidget {
  NextScrean2({Key key}) : super(key: key);

  _NextScrean2State createState() => _NextScrean2State();
}

class _NextScrean2State extends State<NextScrean2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("My GALLERY"),
        centerTitle: true,
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: const EdgeInsets.all(5.0),
        children: 
          _builderTitle(15),
        
      ),
       
    );
  }
}
  List<Widget> _builderTitle(numberofTiles){
    List<Container> container =new List<Container>.generate(numberofTiles, 
    (int index){
      //index =0,1,2,..
      final imageName =index <9 ?
        'images/img${index +1}.jpg' :'images/img${index +1}.jpg';
        return new Container(
          child: new Image.asset(
            imageName,
            fit: BoxFit.cover,),
        );
    });
    return container;
  }
