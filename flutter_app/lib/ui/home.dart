import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Home extends StatelessWidget{
  void _onPress(){
    print("Search Tab");
  }
  void _pressButton(){
    print("print tab");
  }
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amberAccent.shade700,
        title:new Text("Fency Day"),

        actions: <Widget>[
          new IconButton(
            icon:new Icon(Icons.send),
            onPressed:()=>debugPrint("Icon Tapped"),),

          new IconButton(
             icon:new Icon(Icons.search),
             onPressed: _onPress,
          )
        ],
      ),

      // other properties
      backgroundColor:Colors.grey.shade100,
      body: new Container(
        child:new CustomButton(),
        alignment:Alignment.center,
        // child: new Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     new Text("Hashika",
        //       style: new TextStyle(
        //         fontSize: 14.5,
        //         fontWeight: FontWeight.w400,
        //         color: Colors.deepOrange
        //       ),),

        //     new InkWell(

        //       child:new Text("button"),
        //       onTap:_pressButton,
        //     )  
        //   ],
        // ),
        

       
      ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=>debugPrint("Presses"),
        backgroundColor: Colors.lightGreen,
        tooltip: 'Going Up',
        child: new Icon(Icons.call_missed),
      ),

       bottomNavigationBar:new BottomNavigationBar(
         backgroundColor:Colors.deepPurple.shade500,
         items:[
         new BottomNavigationBarItem(icon: new Icon(Icons.add),title: new Text("Hey")),
         new BottomNavigationBarItem(icon: new Icon(Icons.print),title: new Text("Nope")),
         new BottomNavigationBarItem(icon: new Icon(Icons.call_missed),title: new Text("Hello")),
       ],onTap: (int i)=>debugPrint("hey touched $i"),
        )
    );
  }

}
class CustomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(

      onTap: (){
        final SnackBar=new prefix0.SnackBar(content: new Text("Hello Hashika!"),
        backgroundColor:Theme.of(context).backgroundColor,
        duration: new Duration(hours: 0,minutes: 0,seconds: 5,milliseconds: 500,microseconds: 0),);
        Scaffold.of(context).showSnackBar(SnackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        decoration: new BoxDecoration(
          color: Colors.black12,

          borderRadius: new BorderRadius.circular(5.5)
        ),
         child :new Text("First Button",textDirection: TextDirection.ltr),
         
      ),
  
    );
     
  
  }
}






















// class Home extends StatelessWidget{
//   @override
//     Widget build(BuildContext context) {
   
//     return new Container(
//       color:Colors.greenAccent,
//       alignment: Alignment.center,

//       child:new Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new Text("first item",textDirection:TextDirection.ltr,
//           style:new TextStyle(fontSize:10.9)),
//           new Text("second item",textDirection:TextDirection.ltr,
//           style: new TextStyle(fontSize:10.9)),
//           const Expanded(
//             child: const Text("item three") 
              
      //       )
          
          
      //   ],
      // )

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
//     );
//   }

 

  
  
  
 

// }