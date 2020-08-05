import 'package:flutter/material.dart';
import 'loginpage.dart';
class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => new _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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
                    child: Text('Reset your',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Password',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(157.0, 145.0, 0.0, 0.0),
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
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                
               
                    
                    SizedBox(height: 30.0),
                    Material(
                      elevation:10.0,
                      
                      shadowColor: Colors.white,
                    child:TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'New Password',
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
                    SizedBox(height: 15.0),
                    Material(
                      elevation:10.0,
                      
                      shadowColor: Colors.white,
                    child:TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Confirm New Password',
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
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 228.0, 0.0),
                      
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
              builder: (context) => MyHomePage(),
            ),
          );
                          },
                          child: Center(
                            child: Text(
                              'RESET PASSWORD',
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
       
          ],
        ));
  }
}