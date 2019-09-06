import 'dart:io';

import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return new StateWeight();
      }
    
    }
    
    class StateWeight extends State<Home> {

      int radioValue=0;
      final TextEditingController _weightController=new TextEditingController();
      double _finalResult=0.0;
      String _formstText="";
      void radioValueChange(int value){
        setState(() {
          radioValue=value;
        
        switch(radioValue){
          case 0:
            _finalResult=calculateResult(_weightController.text,0.06);
            _formstText="your Weight on Pluto is ${_finalResult.toStringAsFixed(1)  }";
            break;
          case 1:
            _finalResult=calculateResult(_weightController.text, .38);
             _formstText="your Weight on Pluto is ${_finalResult.toStringAsFixed(1)  }";
            break;
           case 2:
            _finalResult=calculateResult(_weightController.text, .91);
             _formstText="your Weight on Pluto is ${_finalResult.toStringAsFixed(1)  }";
            break;  

                    }
        });
        
            
                  }
              @override
              Widget build(BuildContext context) {
                
                return new Scaffold(
                  appBar: new AppBar(
                    title: new Text("Weight On Plannet X"),
                    centerTitle: true,
                    backgroundColor: Colors.black38,
            
                  ),
                  backgroundColor: Colors.blueGrey,
                  body: new Container(
                    alignment: Alignment.topCenter,
                    child: new ListView(
                      padding: const EdgeInsets.all(2.5),
                      children: <Widget>[
                        new Image.asset("images/planet.png",width:200.0,height:133.0),
            
                            new Container(
                              alignment: Alignment.center,
                              child: new Column(
                                children: <Widget>[
                                  
                                  new TextField(
                                    controller: null,
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                      labelText: "weight on plannet x",
                                      hintText: "In Pound",
                                      icon: new Icon(Icons.person_outline)
                                    ),
                                  ),
                                  new Padding(padding: EdgeInsets.all(5.0)),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
            
                                    children: <Widget>[
                                      //radio button
                                      new Radio<int>(
                                        activeColor: Colors.brown,
                                        value: 0,groupValue: radioValue,onChanged: radioValueChange,
                                        
                                      ),
                                      
                                      new Text(
                                        "Pluto",style: new TextStyle(color: Colors.white30),
                                        ),
            
                                      new Radio<int>(
                                        activeColor: Colors.orangeAccent,
                                        value: 1,groupValue: radioValue,onChanged: radioValueChange,
                                      ),
                                      new Text(
                                        "Mars",style: new TextStyle(color: Colors.white30),
                                        ),
            
                                      new Radio<int>(
                                        activeColor: Colors.pinkAccent,
                                        value: 2,groupValue: radioValue,onChanged: radioValueChange,
                                      ),
                                      new Text(
                                        "Venus",style: new TextStyle(color: Colors.white30),
                                        ),
            
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(10.5),),
                                  new Text(
                                    _weightController.text.isEmpty ? "Please enter weight" :_formstText+"lbs",
                                   // "$_formstText",
                                    style:new TextStyle(color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400)
                                  )
                                ],
                                
                              ),
                            )
                      ],
                    ),
                  
            
                    )
                  
            
                );
              }
            
              double calculateResult(String weight, double multiplier) {

                if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
                  return int.parse(weight)*multiplier;
                }
                else{
                  print("wrong");
                }
                return int.parse("180")*.38;

              }
  
}