import 'package:flutter/material.dart';


class Home extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
   
    return new Container(
      color:Colors.greenAccent,
      alignment: Alignment.center,

      child:new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("first item",textDirection:TextDirection.ltr,
          style:new TextStyle(fontSize:10.9)),
          new Text("second item",textDirection:TextDirection.ltr,
          style: new TextStyle(fontSize:10.9)),
          const Expanded(
            child: const Text("item three") 
              
            )
          
          
        ],
      )

      // child:new Column(
      //   mainAxisAlignment:MainAxisAlignment.center,
      //   children:<Widget>[
      //   new Text("first time",textDirection:TextDirection.ltr,
      //   style:new TextStyle(color:Colors.white),),

      //   new Text("first time",textDirection:TextDirection.ltr,
      //   style:new TextStyle(color:Colors.blue),),
      //   ],
      // )
        
      // child:new Text("Hello Container",textDirection:TextDirection.ltr,
      // style:new TextStyle(color:Colors.white,fontWeight: FontWeight.w900,fontSize:18.3 ),)
    );
  }

 

  
  
  
 

}