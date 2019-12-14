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
  String image = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  @override
  Widget build(BuildContext context) {
                return Center(
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
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "please enter Email"
            ),),
            TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "please enter Password"
            ),)
          

          

          
        ],),
       
    );
  }
}

