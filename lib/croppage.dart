
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_crop/image_crop.dart';

import 'editingpage.dart';


// ignore: must_be_immutable
class CropPage extends StatefulWidget {
   List<File> images;
   int index;
  CropPage(this.images,this.index);
  

  @override
  _CropPageState createState() => _CropPageState(this.images,this.index);
}

class _CropPageState extends State<CropPage> {
   List<File> images;
  int index;
  _CropPageState(this.images,this.index);
  final cropKey = GlobalKey<CropState>();
  Future<void> _cropImage() async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }

    // scale up to use maximum possible number of pixels
    // this will sample image in higher resolution to make cropped image larger
    final sample = await ImageCrop.sampleImage(
      file: images[index],
      preferredSize: (2000 / scale).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );
    images[index]=file;
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyEditPage(images)));
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Column(
        children: <Widget>[
          Expanded(
            child: Crop.file(images[index], key: cropKey),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: FloatingActionButton(
        child: Icon(Icons.crop),
        backgroundColor: Colors.yellowAccent,
        hoverColor: Colors.yellow[900],
        foregroundColor: Colors.black,
        onPressed: () {
         _cropImage();
         setState(() {
           
         });
        },
      ),
                ),
                
              ],
            ),
          )
        ],
      );
   


  }


}



  


