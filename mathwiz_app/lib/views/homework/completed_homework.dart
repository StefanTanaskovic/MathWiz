import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/model/firebasefile_model.dart';

class CompletedHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompletedHomeworkScreenState();
  }
}

class _CompletedHomeworkScreenState extends State<CompletedHomeworkScreen> {
  Future<List<FirebaseFile>> futureFiles;

  @override
  void initState(){
    super.initState();

    futureFiles = listAll();
  }
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) => 
  Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final ref = storage.ref().child("homework");
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
    .asMap()
    .map((index, url){
      final ref = result.items[index];
      final name = ref.name;
      final file = FirebaseFile(ref: ref, name: name, url: url);

      return MapEntry(index, file);
    })
    .values
    .toList();
  }
  final List<String> homeworkURLs = [];
  var fb = FirebaseStorage.instance.ref("homework");

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Completed Homework",
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
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Homework:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.022)),
                              ],
                            )),
                          ],
                        )),
                    SizedBox(height: 200,child:
                    Column(
                      children: [
                        FutureBuilder<List<FirebaseFile>>(future: futureFiles,
                          builder: (context,snapshot){
                            switch (snapshot.connectionState){
                              case ConnectionState.waiting:
                                return Center(child: CircularProgressIndicator());
                              default:
                                if (snapshot.hasError){
                                  return Center(child: Text("Some error has occurred!"));
                                }
                                else {
                                final files = snapshot.data;

                                return Expanded(
                                    child: new ListView.builder(
                                    itemCount: files.length,
                                    itemBuilder: (context, index){
                                      final file = files[index];
                                      print(file);
                                      return buildFile(context,file);
                                    },
                                    ),
                                  );
                                }
                            }
                          }) 
                      ]
                    )
                    )
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


    Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
      title: Text(
        file.name,
        style: TextStyle(fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: kPrimaryColor,
        ),
      )
    );


}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
