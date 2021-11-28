import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/firebasefile_model.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:image_gallery_saver/image_gallery_saver.dart';


class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key key,
    this.file,
  }) : super(key: key);

    Future<File> saveFile(String url,String filename) async {
   var response = await Dio().get(
           url,
           options: Options(responseType: ResponseType.bytes));
   final result = await ImageGallerySaver.saveImage(
           Uint8List.fromList(response.data),
           quality: 60,
           name: "hello");
   print(result);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(file.name),
    centerTitle: true,
    actions: [
      IconButton(icon: Icon(Icons.file_download),
      onPressed: () async {
        saveFile(file.url,file.name);
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
