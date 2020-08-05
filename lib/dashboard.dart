import 'dart:io';

import 'package:flutter/material.dart';
import 'newscanpage.dart';
import 'aboutuserpage.dart';

class DashboardPage extends StatelessWidget{
  
   
  
  

  @override 
  Widget build(BuildContext context){
   return new Scaffold(

     bottomNavigationBar: MyBottomNavigationBar(),
   );
  }
}



class MyBottomNavigationBar extends StatefulWidget {

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      body: Scaffold(
         backgroundColor: Colors.blue[600],
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               
               
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left:20,bottom: 0,top: 1),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:20,left: 65,bottom: 0),
                                  child: Text('WELCOME \n \t\tto KAPI ',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ),
                SizedBox(width: 20.0),
               
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight:Radius.circular(50)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0,top: 0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: 
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SingleChildScrollView(
                                  child: Padding(
                                                                      padding: EdgeInsets.only(right: 20),
                                                                      child: Container(
                                                                        width: 255,
                      child: Padding(
                                              padding: EdgeInsets.only(left:10),
                                              child: new Text("Features of Kapi",
                         style: TextStyle(
                           color: Colors.purple[900],
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa'),
                        textAlign: TextAlign.center,
                        ),
                      ),

                    ),
                                  ),
                ),
                

                  ],
                )
                ),
                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Container(
    width: 160,
    height: 85,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      color: Colors.white,
      elevation: 20,
      child: Padding(
              padding: EdgeInsets.only(top:20),
              child: Text('Crop multiple images in free form ',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                            textAlign: TextAlign.center,),
      )
    ),
  ),
                ),
                Container(
    width: 160,
    height: 85,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      color: Colors.white,
      elevation: 20,
      child: Padding(
              padding: EdgeInsets.only(top:20),
              child: Text('Apply Image Filters with more than 20+',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                            textAlign: TextAlign.center,),
      )
    ),
  ),
  Container(
    width: 160,
    height: 85,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      color: Colors.white,
      elevation: 20,
      child: Padding(
              padding: EdgeInsets.only(top:20),
              child: Text('Edit Images from gallery as well as Camera ',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                            textAlign: TextAlign.center,),
      )
    ),
  ),
  Container(
    width: 160,
    height: 85,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      color: Colors.white,
      elevation: 20,
      child: Padding(
              padding: EdgeInsets.only(top:20),
              child: Text('Download and Share your files in pdf format',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                            textAlign: TextAlign.center,),
      )
    ),
  ),


                
                
                
                
                
                ]
            ),
          )
        ],
        ),
        
       
      ),
      ),
      
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanTypePage(),
            ));

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: ()  {
      
                     
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.black,
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUserPage()));
                     
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info,
                         color: Colors.black,
                        ),
                        Text(
                          'About us',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )   );
  }
}