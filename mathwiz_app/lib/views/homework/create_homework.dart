import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
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
  final OCRURL = 'https://api.ocrestful.com/k0qyj/res';
  var getOCR;
  var OCRText;
  var progress = 0;

  final picker = ImagePicker();
  Future getImage() async{
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);

    });
  }


  Future uploadFile() async {
    var fileName = _image.path.split('/').last;
    try {
      FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          _image.path,
          filename: fileName,
        ),
      });

      Dio dio = new Dio();
      dio.options.headers['secret'] = 'WtDBTE5I4zjrNSbKCZPSnu';
      dio.options.headers['accept'] = "application/json";
      dio.post(OCRURL, data:data).then((response){
          print("File upload response: " + response.toString());
          var apiResponse = jsonDecode(response.toString());
          getOCR = apiResponse['handle'];
      });
    } catch (e){
      print("Exception Caught:" + e);
    }

}

  Future getFile() async {
    try{
          Dio dio = new Dio();
          dio.options.headers['secret'] = 'WtDBTE5I4zjrNSbKCZPSnu';
          dio.options.headers['accept'] = "application/json";
          var newUrl = OCRURL + "/" + getOCR + ".txt";
          dio.get(newUrl).then((response){
          print("GET response: " + response.toString());
          setState(() {
            OCRText = response.toString();

          });
        });
    } catch (e) {
      print("Exception Caught:" + e);
    }
  }

  sendToPublish(){
    Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => PublishHomeworkScreen(text: OCRText,),
    ));
  }

  @override
  Widget build(BuildContext context) {
    ui.Size size = MediaQuery.of(context)
        .size;// provides total hieght and width of screen
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
                child:Text("Click below to capture image"),
              ),
              IconButton(
                iconSize: 100,
                icon: Icon(Icons.add_a_photo),
                color: kPrimaryColor,
                onPressed: getImage),
                ElevatedButton(
                child:Text("Convert Picture To Text"),
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor)),
                onPressed: () {
                  uploadFile();
                },
              ),
              ElevatedButton(
                child:Text("Preview Text"),
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor)),
                onPressed: () {
                  getFile();
                }
              ),
              OCRText != null ?
              Text("Preview: " + OCRText,
              style: TextStyle(
              fontSize: 20,
              )): Container(),
              _image != null ?
              Image.asset(_image.path) : Container(),
              ElevatedButton(
                child:Text("Continue to Publish"),
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor)),
                onPressed: () {
                  sendToPublish();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}