
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_crop/image_crop.dart';
import 'package:image/image.dart' as imageLib;
import 'editingpage.dart';


// ignore: must_be_immutable
class RotatePage extends StatefulWidget {
   List<File> images;
   int index;
  RotatePage(this.images,this.index);
  

  @override
  _RotatePageState createState() => _RotatePageState(this.images,this.index);
}

class _RotatePageState extends State<RotatePage> {
  List<File> images;
  int index;
  int variable = 1;
  
  final GlobalKey<ExtendedImageEditorState> editorKey =GlobalKey<ExtendedImageEditorState>();
  _RotatePageState(this.images,this.index);
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: new AppBar(
        title:new Text("Rotate"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> MyEditPage(images)));
               setState(() {
                 
               });
              },
            ),
        ],
      ),
        body: Image.file(images[index]),
          floatingActionButton:FloatingActionButton(
        child: Icon(Icons.rotate_right),
        backgroundColor: Colors.yellowAccent,
        hoverColor: Colors.yellow[900],
        foregroundColor: Colors.black,
        onPressed: () {

          Transform.rotate(
  angle: pi /2,
  child: Container(
    padding: const EdgeInsets.all(8.0),
    color: const Color(0xFFE8581C),
    child: const Text('Apartment for rent!'),
  ),
);
        //  var imageFile = File(images[index].path);  
        //       var image = imageLib.decodeImage(imageFile.readAsBytesSync());  
        //       var convertedimage = imageLib.copyRotate(image, 90, interpolation: imageLib.Interpolation.nearest);
        //        File(images[index].path).writeAsBytesSync(imageLib.encodePng(convertedimage));
          setState(() {
            
          });
        
                      },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
                
              
   


  


  }}
  


