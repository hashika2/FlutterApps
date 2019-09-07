import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();

  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;
  int radioValue = 0;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "";

  void handleRadioValueChanged(int value) {
    /*
    Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
      Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06
     */
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _planetName = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _planetName = "Your Venus on Pluto is ${_finalResult.toStringAsFixed(1)}";

          break;
        default:
          print("Nothing selected!");
      }

//      print("Value is ${radioValue.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Your Weight on Earth',
                        hintText: 'In pounds',
                        icon: new Icon(Icons.person_outline)),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //three toggle buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radiobuttons go here
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),

                  //Result text
                  new Padding(padding: new EdgeInsets.all(15.0)),

                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _planetName +" lbs",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty &&  int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }

  }
}
