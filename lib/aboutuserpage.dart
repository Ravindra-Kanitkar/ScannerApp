import 'package:flutter/material.dart';
import 'package:myapp/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUserPage extends StatefulWidget {
  @override
  _AboutUserPageState createState() => _AboutUserPageState();
}

class _AboutUserPageState extends State<AboutUserPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.lightBlue),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 10.0),
                Text(
                  'Ravindra Kanitkar',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa'),
                      textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[ InkWell(
                    child: new Image.asset("assets/images/linkedinIcon.png",
                    scale: 14,
                    ),
                  onTap: () => launch("https://www.linkedin.com/in/ravindra-kanitkar/"),
                                  ),
                   InkWell(
                    child: new Image.asset("assets/images/githubIcon.png",
                    scale: 14,
                    ),
                  onTap: () => launch("https://github.com/Ravindra-Kanitkar"),
                                  ),
                    
                                  
                  ],
                ),
                       SizedBox(height: 10.0),
                SingleChildScrollView(
                                  child: Padding(
                                                      padding: EdgeInsets.only(right: 20),
                                                      child: Material(
                     
                      child: Container(
                        width: 300,
                        child: new Text("Hello I am Ravindra Rajendra Kanitkar, I am third year student of Sipna College of Engineering, Amravati with specialization in Computer Science and Engineering. I am Full stack web developer in Python and love to do ui/ux design. I am currently working on flutter project. I am positive minded person and thinks positively about particular condition. Thank you",
                         style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa'),
                        textAlign: TextAlign.justify,
                        ),

                      ),
                    ),
                  ),
                ),
               
                
                   
              
              ],
            ))
      ],
    ));
  }
}
// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}