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
  var _nameFieldController=new TextEditingController();

  String welcomName="!";
  
  void _irase(){
    setState(() {
     _userController.clear();
     _passwordController.clear(); 
    });
  }
    void _welcomeShow(){
  
  
  if(_userController.text=="hashika" && _passwordController.text=="12345"){
        welcomName=_userController.text;
  Future _gotToNextScreen(BuildContext context)async{
    Map result=await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
        builder:(BuildContext context){
          return new NextScrean(name: _nameFieldController.text);
        }
        
      ),
      
    );
    if(result !=null && result.containsKey('info')){
        print(result['info'].toString());
        _nameFieldController.text=result['info'].toString();
      }else{
        debugPrint("Nothing");
      }
  }
  }
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
                          onPressed: (){
                            var router=new MaterialPageRoute(
                              builder: (BuildContext context){
                                
                                return NextScrean();
                                }
                              
                            );
                            Navigator.of(context).push(router);
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
                    
                    new Text('Welcome $welcomName\n',
                              
                              
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


//   void _welcomeShow(){
//     setState(() {
      
//         age="age is 23";
//         universty="University of Kelaniya";
//         course="Studing Softawre Engineering";
//         email="email :m.g.hashikamaduranga@gmail.com";
//         pnumber="0774164979";
      
      

//     });
  
 
// }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("Second screan"),
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