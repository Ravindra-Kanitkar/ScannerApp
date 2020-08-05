import 'package:image_cropper/image_cropper.dart';
import 'package:images_to_pdf/images_to_pdf.dart';
import 'package:page_slider/page_slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as imageLib;
import 'croppage.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'downloadpage.dart';
import 'newscanpage.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:photofilters/photofilters.dart';
import 'package:path/path.dart' as path;
import 'rotatepage.dart';
// ignore: must_be_immutable
class MyEditPage extends StatefulWidget {
  File imgfile;
  List<File> images;
  MyEditPage(this.images);
  
  

  @override
  _MyEditPageState createState() => _MyEditPageState(this.images);
}

class _MyEditPageState extends State<MyEditPage> {
  List<File> images;
  
  int index=0;
  double _scale = 1.0;
  double _previousScale = 1.0;
  int variable = 1;
  GlobalKey<PageSliderState> _slider = GlobalKey();
  File imgfile;
  File _pdfFile;
  String _status = "Not created";
  FileStat _pdfStat;
  bool _generating = false;

  String fileName;
  List<Filter> filters = presetFiltersList;
  File imageFile;
 

   Future<void> _createPdf() async {
    try {
      this.setState(() => _generating = true);
      final tempDir = await getApplicationDocumentsDirectory();
      final File output = File(path.join(tempDir.path, 'example.pdf'));

      this.setState(() => _status = 'Preparing images...');
      
      this.setState(() => _status = 'Generating PDF');
      await ImagesToPdf.createPdf(
        pages: images
            .map(
              (file) => PdfPage(
                imageFile: file,
                size: Size(1920, 1080),
                compressionQuality: 0.5,
              ),
            )
            .toList(),
        output: output,
      );
      _pdfStat = await output.stat();
      _pdfFile = output;
      this.setState(() {
        _pdfFile = output;
        _status = 'PDF Generated (${_pdfStat.size ~/ 1024}kb)';
      });
    } catch (e) {
      this.setState(() => _status = 'Failed to generate pdf: $e".');
    } finally {
      this.setState(() => _generating = false);
    }
  }


  
  _MyEditPageState(this.images);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Edit your Image'),
      ),
      body: Center(
        child: Stack(
                  children:<Widget>[
                    
            SingleChildScrollView(
                          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PageSlider(
                  key: _slider,
                  duration: Duration(milliseconds: 400),
                  pages: <Widget>[
                   for (var i in images)
                   Material(child: 
                   Center (
          child: Container(
           
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: Image.file(i,
            
            )
           
            ),
          ),
        )
                   
                   ),
                   
                  
                  ],
                ),
                
                
              ],
          ),
            ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  
                  Align(
                    alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 8,left: 15),
                                                                              child: Container(
                                          height: 50,
                                          width: 50,
                                                                                child: FloatingActionButton(
                                            
                        heroTag: "btn1",
                        child: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                           if(index>0){
                        index = index-1;
                        _slider.currentState.previous();
                           }
                           else{
                          index = 0;
                         
                        
                           }
                        setState(() {
                          
                        });
                        },
                      ),
                                        ),
                                      ),
                  ),
               Align(
                 alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom:8,right: 15),
                                                                  child: Container(
                                    height: 50,
                                    width: 50,
                        child: FloatingActionButton(
                                            
                        heroTag: "btn2",
                        child: Icon(Icons.arrow_forward_ios),
                        onPressed: () async { 
                         if (index <images.length){
                        index = index+1;
                        _slider.currentState.next();
                        setState(() {});
                        
                        }else{
                        index=0;
                       
                         }
                         
                        setState(() {
                          
                        });
                        },
                      ),
                                  ),
                                ),
               ),
                
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn3",
        child: Icon(Icons.file_download),
        onPressed: () async {
          await _createPdf();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyDownloadPage(images),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: ()  async{
                      var imageFile = File(images[index].path);  
     fileName = path.basename(imageFile.path);  
     var image = imageLib.decodeImage(imageFile.readAsBytesSync());  
     image = imageLib.copyResize(image, width: 600);  
     Map imagefile = await Navigator.push(  
       context,  
       new MaterialPageRoute(  
         builder: (context) => new PhotoFilterSelector(  
           title: Text("Photo Filters"),  
           image: image,  
           filters: filters,  
           filename: fileName,  
           loader: Center(child: CircularProgressIndicator()),  
           fit: BoxFit.contain,  
         ),  
       ),  
     );  
     if (imagefile != null && imagefile.containsKey('image_filtered')) {  
       setState(() {  
         imageFile = imagefile['image_filtered'];  
        images[index] = imageFile;
       });  
     }  
        
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.black,
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: ()  async{
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> CropPage(images,index)));
                     setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.crop,
                          
                        ),
                        Text(
                          'Crop',
                          style: TextStyle(
                              color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () async {
                   File imagefile= await ImageCropper.cropImage(
      sourcePath: images[index].path,
      aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              
              ],
      androidUiSettings: AndroidUiSettings(
          
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
        
          showCropGrid: false,
          lockAspectRatio:false,
        ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      )
    );
                      setState(() {
                        images[index] = imagefile;
                      });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.rotate_left,
                          color: Colors.black,
                        ),
                        Text(
                          'Rotate',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanTypePage()));
                     
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_a_photo,
                         color: Colors.black,
                        ),
                        Text(
                          ' Add ',
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
      )
      );
   
    
    
  }
  


}



  


