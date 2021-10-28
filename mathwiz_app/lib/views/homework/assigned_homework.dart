import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import '../../constants.dart';

class AssignedHomeworkScreen extends StatefulWidget {

  final HomeworkModel homework;
  AssignedHomeworkScreen({this.homework});
  @override
  State<StatefulWidget> createState() {
    return _AssignedHomeworkScreenState(homework:homework);
  }
}

class _AssignedHomeworkScreenState extends State<AssignedHomeworkScreen> {
  String imageURL;
  var count = 1;
  uploadImage() async {
    PickedFile _image;
    final picker = ImagePicker();

    _image = await picker.getImage(source: ImageSource.camera, imageQuality: 65);
    var file = File(_image.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    var snapshot = await storage.ref().child('homework/${homework.title}/Submitted:' + DateTime.now().toString()).putFile(file);
    var downloadURL = await snapshot.ref.getDownloadURL();

    setState(() {
      imageURL = downloadURL;
    });
  }

  HomeworkModel homework;
  _AssignedHomeworkScreenState({this.homework});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assigned Homework",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.025,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500], width: 2.0)),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        width: size.width / 1.61,
                        height: size.height * 0.22,
                        child: Column(
                          children: [
                            Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Text('Title - ${homework.title}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                                                        Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Flexible(child:Text('Questions:${homework.ocrtext}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Text('Reward - ${homework.gold}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019)),
                                    Icon(Icons.attach_money,
                                        color: Colors.yellow[800],
                                        size: size.height * 0.02),
                                  ],
                                )
                              ],
                            )),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                                child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Flexible(child:Text('Description:${homework.description}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.019))),
                                  ],
                                )
                              ],
                            )),
                          ],
                        )),
                    Container(
                        child: Column(
                      children: [
                        (imageURL == null)
                        ?IconButton(
                            iconSize: 100,
                            icon: Icon(Icons.add_a_photo),
                            color: kPrimaryColor,
                            onPressed: () => uploadImage()
                        )
                      : Placeholder(fallbackHeight: 0, fallbackWidth: 0),
                      Container( height: 170,
                      width: 130,
                      child:(imageURL != null)
                      ? Image.network(imageURL)
                      : Placeholder(fallbackHeight: 10, fallbackWidth: 10),
                      ),
                      ],
                    ))
                  ],
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}





