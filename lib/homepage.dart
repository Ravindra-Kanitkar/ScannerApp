import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/dashboard.dart';

class HomePage extends StatelessWidget{
  

  @override 
  Widget build(BuildContext context){
    Timer(
            Duration(seconds: 3),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => DashboardPage())));
   return new Scaffold(
    body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/background.png"), fit: BoxFit.cover,
              colorFilter: ColorFilter.srgbToLinearGamma()),
          ),
        ),
        new Center(
          child: new Image.asset(
            "assets/images/logo.png",
            color: Colors.yellowAccent
           
            )
        )
      ],
    )

    
  );
  }
  
}
