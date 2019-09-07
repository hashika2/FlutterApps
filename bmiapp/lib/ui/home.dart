import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
    return new BmiAppstate();
      }
    
    }
    
    class BmiAppstate extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
     
      
      appBar: new AppBar(
        title:new Text("BMI App",
        style: new TextStyle(fontSize: 20.6),),
        backgroundColor: Colors.pinkAccent,

      ),
       backgroundColor: Colors.white,
      
      
       body: new Container(
         margin: const EdgeInsets.all(12.6),
         child:new ListView(
           children: <Widget>[
             Image.asset("images/bmi.png",height: 180.0,width: 280.0,),
             new Container(
              
               width: 320.0,
               height: 200.0,
               color: Colors.grey,
               child: new Column(
                 children: <Widget>[
                   //Padding(padding: EdgeInsets.all(12.5),
                    new TextField(
                     controller: null,
                     keyboardType:TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: "Age",
                       icon: new Icon(Icons.person)
                     ),
                     
                   ),
                  new TextField(
                     controller: null,
                     keyboardType:TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: "Height In Feat",
                       icon: new Icon(Icons.person)
                     ),

                   ),
                   new TextField(
                     controller: null,
                     keyboardType:TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: "Weight In lb",
                       icon: new Icon(Icons.person)
                     ),
                   
                   
                   ),
                   new Padding(padding: EdgeInsets.all(10.5),),
                   new Container(
                   child: new Column(
                      children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 40.8),
                        child:new RaisedButton(
                          onPressed: null,
                          color: Colors.pinkAccent,
                          child: new Text("Calculate",
                          style:new TextStyle(fontSize: 12.5,fontWeight:FontWeight.w500,color: Colors.white)),
                        )
                      )
                      ],
                     )
                   )
                   
                 ],
                 
               ),
               
             ),
             new Padding(padding: EdgeInsets.all(10.5),),

             new Row(
               children: <Widget>[
                 new Text("this is Calculte",
                 style:new TextStyle(
                   color:Colors.black26,
                   fontWeight:FontWeight.w500,
                   
                 ))
               ],
             )
           ],
         )
       ),
      
    );
  }
}