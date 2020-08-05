import 'package:flutter/material.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
                    padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                    child: new Image.asset('assets/images/goback.png',
                    scale: 0.7
                    ),
                  );
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  container,

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Register',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Here',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(93.0, 145.0, 0.0, 0.0),
                    child: Text('...',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 55.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink)),
                  ),
                  
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Material(
                      elevation:10.0,
                      shadowColor: Colors.white,
                    child:TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink,
                              width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent[400]))
                              
                              ),
                    )),
                    
                    SizedBox(height: 20.0),
                    Material(
                      elevation:10.0,
                      
                      shadowColor: Colors.white,
                    child:TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink,
                              width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent[400]))
                              ),
                      obscureText: true,
                    )),
                    SizedBox(height: 20.0),
                    Material(
                      elevation:10.0,
                      
                      shadowColor: Colors.white,
                    child:TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Forgot Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink,
                              width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent[400]))
                              ),
                      obscureText: true,
                    )),
                    SizedBox(height: 30.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.pinkAccent,
                        color: Colors.pink,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already Registered ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => MyHomePage())
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}