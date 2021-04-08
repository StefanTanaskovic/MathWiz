import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mathwiz_app/views/homework/publish_homework.dart';

import '../../constants.dart';

class CreateHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateHomeworkScreenState();
  }
}

class _CreateHomeworkScreenState extends State<CreateHomeworkScreen> {
  File _image;
  // FirebaseVisionTextDetector detector = FirebaseVisionTextDetector.instance;
  String _text = '';
  final picker = ImagePicker();
  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
/*
  Future scanText() async{
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(_image);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);

    String text = visionText.text;
    print(text);
    for (TextBlock block in visionText.blocks){
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        for (TextElement element in line.elements){
          _text += element.text;
        }
      }
    }
    print(_text);
    if (_text != ""){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PublishHomeworkScreen(_text)));
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    ui.Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Homework",
            style: TextStyle(
              fontSize: 20,
            )),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Center(
                child: Text("Click below to capture image"),
              ),
              IconButton(
                  iconSize: 100,
                  icon: Icon(Icons.add_a_photo),
                  onPressed: getImage),
              ElevatedButton(
                child: Text("Scan"),
                onPressed: () {
                  //scanText();
                },
              ),
              _image != null ? Image.asset(_image.path) : Container(),
              Text(_text),
            ],
          ),
        ),
      ),
    );
  }
}
