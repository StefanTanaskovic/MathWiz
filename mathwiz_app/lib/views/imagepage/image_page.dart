import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/model/firebasefile_model.dart';
import 'package:image_save/image_save.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/firebasefile_model.dart';
import 'package:http/http.dart' as http;

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key key,
    this.file,
  }) : super(key: key);

    void saveImage(String url) async {
      try {
        var uri = Uri.parse(url);
        var response = await http
        .get(uri);


      bool success = await ImageSave.saveImage(response.bodyBytes, "${file.name}", albumName: "Homework");
      }
      catch (e){
        print("An Error Occurred:" + e.toString());
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(file.name),
    centerTitle: true,
    backgroundColor: kPrimaryColor,
    actions: [
      IconButton(icon: Icon(Icons.file_download),
      onPressed: () async {
        await saveImage(file.url);
      },
      ),
      const SizedBox(width: 12),
    ],
    ),
    body:Image.network(file.url,
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.cover,
    ),
);
  }
}
