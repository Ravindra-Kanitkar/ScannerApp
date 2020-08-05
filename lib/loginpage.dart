import 'package:flutter/material.dart';
import 'registerpage.dart';
import 'otppage.dart';
import 'resetotppage.dart';
import 'dashboard.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        resizeToAvoidBottomInset: false,
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  container,

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Login',
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
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 195.0, 0.0),
                      child: InkWell(
                        onTap: () {
                            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(),
            ),
          );
                          },
                        child: Text(
                          'Forgot Password ?',
                          
                          style: TextStyle(
                            fontFamily:'Roboto',
                              fontSize: 13.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                          
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.pinkAccent,
                        color: Colors.pink,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(),
            ),
          );
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
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
                  'New to Kapi ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
          );
                  },
                  child: Text(
                    'Register',
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