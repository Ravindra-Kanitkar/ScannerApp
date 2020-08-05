import 'package:flutter/material.dart';
import 'registerpage.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => new _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
                    child: Text('OTP',
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
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
              
                        child: Text(
                          'Enter OTP sent to ravi@gmail.com',
                        
                          style: TextStyle(
                            fontFamily:'Roboto',
                              fontSize: 13.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                          
                              ),
                        ),
                      ),
                      
               
                    
                    SizedBox(height: 20.0),
                    Material(
                      elevation:10.0,
                      
                      shadowColor: Colors.white,
                    child:TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'Enter OTP',
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
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 228.0, 0.0),
                      child: InkWell(
                        child: Text(
                          'Resend OTP?',
                          
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
              builder: (context) => OtpPage(),
            ),
          );
                          },
                          child: Center(
                            child: Text(
                              'SUBMIT',
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