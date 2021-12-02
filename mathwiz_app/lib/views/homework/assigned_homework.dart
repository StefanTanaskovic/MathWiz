import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mathwiz_app/controllers/achievement_notifier.dart';
import 'package:mathwiz_app/model/homework_model.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import '../../constants.dart';

class AssignedHomeworkScreen extends StatefulWidget {
  final HomeworkModel homework;
  AssignedHomeworkScreen({this.homework});
  @override
  State<StatefulWidget> createState() {
    return _AssignedHomeworkScreenState(homework: homework);
  }
}

class _AssignedHomeworkScreenState extends State<AssignedHomeworkScreen> {
  String imageURL;
  var count = 1;
  uploadImage() async {
    PickedFile _image;
    final picker = ImagePicker();

    _image =
        await picker.getImage(source: ImageSource.camera, imageQuality: 65);
    var file = File(_image.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    var snapshot = await storage
        .ref()
        .child(
            'homework/${homework.title}/Submitted:' + DateTime.now().toString())
        .putFile(file);
    var downloadURL = await snapshot.ref.getDownloadURL();

    setState(() {
      imageURL = downloadURL;
    });
  }

  HomeworkModel homework;
  _AssignedHomeworkScreenState({this.homework});
  @override
  Widget build(BuildContext context) {
    AchievementNotifier achievementNotifier =
        Provider.of<AchievementNotifier>(context, listen: false);
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Assigned Homework"),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                          child: Stack(
                        children: [
                          Row(
                            children: [
                              Text('Title: ${homework.title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          )
                        ],
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Stack(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text('Questions: ${homework.ocrtext}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                            ],
                          )
                        ],
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Stack(
                        children: [
                          Row(
                            children: [
                              Text('Reward: ${homework.gold}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Icon(
                                Icons.circle,
                                color: Colors.yellow[800],
                              ),
                            ],
                          )
                        ],
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Stack(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                  child: Text(
                                      'Description: ${homework.description}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))),
                            ],
                          )
                        ],
                      )),
                    ],
                  )),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  child: (imageURL == null)
                      ? IconButton(
                          iconSize: 100,
                          icon: Icon(Icons.add_a_photo),
                          color: kPrimaryColor,
                          onPressed: () {
                            uploadImage();
                            achievementNotifier.addPointsHomework();
                          })
                      : Image.network(imageURL)),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
