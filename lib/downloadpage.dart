import 'dart:io';
import 'dart:typed_data';

// import 'package:documents_picker/documents_picker.dart';
import 'package:dio/dio.dart';
import 'package:download_manager/download_manager.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share/share.dart';
import 'package:share_extend/share_extend.dart';


// ignore: must_be_immutable
class MyDownloadPage extends StatefulWidget {
  List<File> images;
  MyDownloadPage(this.images);

 

  @override
  _MyDownloadPageState createState() => _MyDownloadPageState(this.images);
}

class _MyDownloadPageState extends State<MyDownloadPage> {
  List<File> images;
  File myfile;
  _MyDownloadPageState(this.images);
  String alert = " ";
  var image;

   _shareStorageFile() async {
    Directory dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    File testFile = myfile;
    if (!await testFile.exists()) {
      await testFile.create(recursive: true);
      testFile.writeAsStringSync("test for share documents file");
    }
    ShareExtend.share(testFile.path, "file");
  }


  Future<void> _createPDF() async {
     var pdf = pw.Document();
    for(int i=0;i<images.length;i++){
    var image = PdfImage.file(
  pdf.document,
  bytes: images[i].readAsBytesSync(),
);
   pdf.addPage(pw.Page(
    build: (pw.Context context) {
      return pw.Center(
        child: pw.Image(image),
      ); // Center
    }));
     } // Page
    //Save the document
    var bytes = pdf.save();
   Directory directory = await getExternalStorageDirectory();
//Get directory path
String path = directory.path;
//Create an empty file to write PDF data
myfile = File('$path/Output.pdf');
//Write PDF data
await myfile.writeAsBytes(bytes, flush: true);
  }
  

  


 
  
  
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
                        child: Text('Download',
                            style: TextStyle(
                              fontFamily:'Comfortaa',
                                fontSize: 40.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                        child: Text('your files',
                            style: TextStyle(
                              fontFamily:'Comfortaa',
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(160.0, 145.0, 0.0, 0.0),
                        child: Text('...',
                            style: TextStyle(
                              fontFamily:'Comfortaa',
                                fontSize: 55.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
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
            alert = "Saving..";
            setState(() {
              
            });
            await _createPDF();
            
            setState(() {
              
              alert = "Saved Successfully";
            });
             Future.delayed(const Duration(milliseconds: 5000), () {
                     alert = " ";
                     setState(() {
                       
                     });
                     });
            print(myfile.path);
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0,
                    ),
                    color: Colors.greenAccent[400],
                    borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Center(
                            child: Text(
                               "DOWNLOAD",
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
                        SizedBox(height: 10.0),
    
          SizedBox(height: 20.0),
          Container(
              height: 50.0,
              child: GestureDetector(
                  onTap: () {
                    if (myfile != null){
                     _shareStorageFile();

                    }
                    else{
                      alert = "Please Download File First";
                      setState(() {
                        
                      });
                       Future.delayed(const Duration(milliseconds: 5000), () {
                     alert = " ";
                     setState(() {
                       
                     });
                     });
                    }
                    
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
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
                                     "SHARE",
                                      style: TextStyle(
                                          color: Colors.blue[900],
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
                              Center(child: new Text(alert))
      
      
                        ],
                      )),
              
                 
                ],
              ));
        }
      
       
}