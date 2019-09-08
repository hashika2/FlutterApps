import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
    return new BmiAppstate();
      }
    
    }
    
    class BmiAppstate extends State<Home> {
  String _finalResult;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _ageEditingController=new TextEditingController();
    final TextEditingController _weightEditingController=new TextEditingController();
    final TextEditingController _heightEdingController=new TextEditingController();
    double inches=0.0;
    double result=0.0;
    String _weightBMI="";

    void calculateMbi(){
      setState(() {

       int age=int.parse(_ageEditingController.text);
       double height=double.parse(_heightEdingController.text); 
       inches=height*12;
       double weight=double.parse(_weightEditingController.text);

       if((_ageEditingController.text.isNotEmpty || age>0)&&(_heightEdingController.text.isNotEmpty)|| _weightEditingController.text.isNotEmpty || weight>0){
         result=weight/(inches*inches)*703; //our bmi

         if(double.parse(result.toStringAsFixed(1))<18.5){
           _weightBMI="UnderWeight";
         }
         else if(double.parse(result.toStringAsFixed(1))<=18.5 && result<25){
           _weightBMI="Great Shape";
         }
         else if(double.parse(result.toStringAsFixed(1))<=25 && result<30){
           _weightBMI="OverWeight";
         }
         else if(double.parse(result.toStringAsFixed(1))>30){
           _weightBMI="Obse";
         }

       }
      });
      _finalResult="Your BMI :${result.toStringAsFixed(1)}";
    }
    
    return new Scaffold(
     
      
      appBar: new AppBar(
        title:new Text("BMI App",
        style: new TextStyle(fontSize: 20.6),),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,

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
               color: Colors.grey.shade300,
               child: new Column(
                 children: <Widget>[
                   //Padding(padding: EdgeInsets.all(12.5),
                   
                    new TextField(
                     controller: _ageEditingController,
                     keyboardType:TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: "Age",
                       icon: new Icon(Icons.person_outline)
                     ),
                     
                   ),
                  new TextField(
                     controller: _heightEdingController,
                     keyboardType:TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: "Height In Feat",
                       icon: new Icon(Icons.insert_chart)
                     ),

                   ),
                   new TextField(
                     controller: _weightEditingController,
                     keyboardType:TextInputType.number,
                     decoration: new InputDecoration(
                       hintText: "Weight In lb",
                       icon: new Icon(Icons.line_weight)
                     ),
                   
                   
                   ),
                   new Padding(padding: EdgeInsets.all(10.5),),
                   new Container(
                   child: new Column(
                      children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 35.8),
                        child:new RaisedButton(
                          onPressed:calculateMbi,
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

             new Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 
                 new Text("BMI is $_finalResult",
                 style:new TextStyle(
                   color:Colors.blueAccent,
                   fontWeight:FontWeight.w500,
                   fontSize: 12.6,
                   
                 )),
                 
                 new Padding(padding: EdgeInsets.all(10.5),),
              
                    new Text("Over Weight $_weightBMI",
                    style:new TextStyle(
                      color:Colors.pinkAccent,
                      fontWeight:FontWeight.w500,
                      fontSize: 16.7
                   
                 )),

                 
               ],
             ),
             
             
           ],
         )
       ),
      
    );
  }
}