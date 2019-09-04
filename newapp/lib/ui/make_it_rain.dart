import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return new MakeItRainState();
          }
        
        }
    
    
    class MakeItRainState extends State<MakeItRain> {
      int _moneyCounter=0;
      int _reduceMoneyCounter;
     void _setTotal(){
       setState(() {
         _moneyCounter=_moneyCounter+100;
         
       });
       
      }
      void _redMoney(){
        setState(() {
          _reduceMoneyCounter=_moneyCounter-100;
        });
      }
     

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make it Rain",),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text("Get Rich!",
              style: new TextStyle(
              backgroundColor: Colors.pink,
              fontWeight: FontWeight.w400,
              fontSize:29.4
            ),) ,
            ),

            new Expanded(
              child: new Center(
                child: new Text('\$$_moneyCounter',
                style:new TextStyle(
                  fontSize: 40.9,
                  fontWeight: FontWeight.w700,
                  color: _moneyCounter>500 ?Colors.redAccent :Colors.blueAccent
                  )),
              ),
            ),
            
            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.greenAccent,
                  textColor: Colors.white70,
                  onPressed:_setTotal,
                  child: new Text("Let it Rain",
                  style: new TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 23.5),),),
              ),
            ),

            new Expanded(
              child:new Center(
                child: new FlatButton(
                color: Colors.deepPurpleAccent,
                textColor: Colors.white70,
                onPressed: _redMoney,
                child: new Text("Let it Worm",
                style:new TextStyle(
                  fontWeight: FontWeight.w200,
                    fontSize: 23.5 
                ) ,),),
              )
              
            )
            
           
          ],
        ),
      ),
    );
  }
  
}