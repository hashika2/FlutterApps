import 'package:flutter/material.dart';

class NextScrean2 extends StatefulWidget {
  NextScrean2({Key key}) : super(key: key);

  _NextScrean2State createState() => _NextScrean2State();
}

class _NextScrean2State extends State<NextScrean2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("My GALLERY"),
        centerTitle: true,
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: const EdgeInsets.all(5.0),
        children: 
          _builderTitle(15),
        
      ),
       
    );
  }
}
  List<Widget> _builderTitle(numberofTiles){
    List<Container> container =new List<Container>.generate(numberofTiles, 
    (int index){
      //index =0,1,2,..
      final imageName =index <9 ?
        'images/img${index +1}.jpg' :'images/img${index +1}.jpg';
        return new Container(
          child: new Image.asset(
            imageName,
            fit: BoxFit.cover,),
        );
    });
    return container;
  }
