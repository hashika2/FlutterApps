import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Material(

        color: Colors.blue,
        child: new Center(child: new Text(
          "Welcome",
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontWeight: FontWeight.w900, fontSize: 45.45),
        ),
        )

    );
  }
}