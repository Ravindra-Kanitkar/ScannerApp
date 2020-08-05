import 'package:flutter/material.dart';
import 'package:myapp/loginpage.dart';

import 'dashboard.dart';
import 'homepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Scanner App",
      theme: ThemeData(
        primarySwatch:Colors.pink,
        
      ),
      home: HomePage(),
    );
  }
}