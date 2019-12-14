import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
setImage(){
 
}
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count =0;
  String _email,_password;
  final GlobalKey<FormState>_formKey =GlobalKey<FormState>();
  String image = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  @override
  Widget build(BuildContext context) {
                return 
                Scaffold(
                     body:  Form(
                       key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Image.network(image),
          new RaisedButton(
            child: Text("Click"),
            onPressed: (){
              setState(() {
                image = "https://images.pexels.com/photos/458766/pexels-photo-458766.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
              });
            },
          ),
          TextFormField(
            validator:(input){
              if(input.length<6){
                return 'tour email needs to be at least 6';
              }
            },
            onSaved: (input)=> _email=input,
            decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
            validator:(input){
              if(input.length<6){
                return 'tour password needs to be at least 6';
              }
            },
            onSaved: (input)=> _password=input,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text("Login"),
            )
          // TextField(
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     hintText: "please enter Email"
          //   ),),
          //   TextField(
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     hintText: "please enter Password"
          //   ),)
          

          

          
        ],),
       
    ),
                );
           
  }
  Future<void> signIn() async{
    print("hashik");
    final formState =_formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _password);
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
      }catch(e){
        print("error");
      }
      
    }
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Image.network("https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              Text("Welcome to my Page",style: TextStyle(color: Colors.blueAccent,fontSize: 40.0),),
           ],
         )
        
       ),
    );
  }
}

