import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class PublishHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PublishHomeworkScreenState();
  }
}

class _PublishHomeworkScreenState extends State<PublishHomeworkScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
    getData();
  }

  Future getData() async{
    var response = await http.post(
      Uri.https("https://mathwizocr.cognitiveservices.azure.com", _image.path),
      headers: {
        "key": "d8c7258c660d4ae5b24d352e66e240c2",
        "Accept": "application/json"
      }
    );
    print(response.body);
  }
  
  String _textValue = " ";
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
                child:Text("Click below to capture image")
              ),
              IconButton(
                  iconSize: 100,
                  icon: Icon(Icons.add_a_photo),
                  onPressed: getImage),
              Text(_textValue),
              BoxInputFeild(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {},
              ),
              BoxInputFeild(
                hintText: "Coins",
                icon: Icons.attach_money,
                onChanged: (value) {},
              ),
              Container(
                width: size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      hintText: 'Description'),
                  maxLines: 5,
                ),
              ),
              BoxButton(
                text: "Save To Drafts",
                press: () {},
              ),
              BoxButton(
                text: "Publish",
                press: () {},
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}