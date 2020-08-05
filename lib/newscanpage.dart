
import 'package:christian_picker_image/christian_picker_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_media_picker/multi_media_picker.dart' as postfix;
import 'dashboard.dart';
import 'editingpage.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'editingpage.dart';


class ScanTypePage extends StatefulWidget {
  @override
  _ScanTypePageState createState() => _ScanTypePageState();
}

class _ScanTypePageState extends State<ScanTypePage> {
  File _imageFile;
  // final _picker = ImagePicker();

 List<File> _images;

  

  Future<void> getImageFromGallery() async {
    var images = await postfix.MultiMediaPicker.pickImages(source: postfix.ImageSource.gallery,singleImage: false);
    
    setState(() {
      _images = images;
    });
  }

  
  Future<void> _pickImage() async {
   List<File> images  = await ChristianPickerImage.pickImages(maxImages: 250);
  setState(() {
   _images = images;
  });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                 onTap: () {
                            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(),
            ),
          );
                          },
                                      child: Container(
                      padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                      child: new Image.asset('assets/images/goback.png',
                      scale: 0.7
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Choose your',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 35.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('scan type',
                        style: TextStyle(
                          fontFamily:'Comfortaa',
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(185.0, 140.0, 0.0, 0.0),
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
                padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    
                      Container(
    height: 50.0,
    child: GestureDetector(
        onTap: () async {  
         await _pickImage();
         if (_images.isEmpty){
         print("Better Luck Next Time");
         }
         else{
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyEditPage(_images),
            ));
         }
    
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.pink,
                    style: BorderStyle.solid,
                    width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Center(
                        child: Text(
                           "SCAN WITH CAMERA",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                            ),
                        ),
                    )
                ],
            ),
        ),
    ),
),
                    SizedBox(height: 20.0),

      
                     Container(
    height: 50.0,
    child: GestureDetector(
        onTap: () async { await getImageFromGallery();
        if (_images != null){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyEditPage(_images),
            ));
        }
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.pink,
                    style: BorderStyle.solid,
                    width: 1.0,
                ),
                color: Colors.pink,
                borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Center(
                        child: Text(
                           "UPLOAD FROM GALLERY",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                            ),
                        ),
                    )
                ],
            ),
        ),
    ),
),
                  ],
                )),
      

        ]
           
    
        ));
  }
}