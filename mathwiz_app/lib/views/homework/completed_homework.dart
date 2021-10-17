import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CompletedHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompletedHomeworkScreenState();
  }
}

class _CompletedHomeworkScreenState extends State<CompletedHomeworkScreen> {
  @override
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
                                Text("Viktor:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.022)),
                              ],
                            )),
                          ],
                        )),
                    Container(
                        child: Column(
                      children: [
                        FutureBuilder(
                          future: _getImage(context, "face.jpg"),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.done) {
                              return Container(
                                width:  MediaQuery.of(context).size.width / 3,
                                height:  MediaQuery.of(context).size.width / 3,
                                child: snapshot.data,
                              );
                            }

                            if(snapshot.connectionState == ConnectionState.waiting) {
                              return Container(
                                width:  MediaQuery.of(context).size.width / 1.2,
                                height:  MediaQuery.of(context).size.width / 1.2,
                                child: CircularProgressIndicator(),
                              );
                            }

                            return Container();
                          }
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

  Future<Widget> _getImage(BuildContext context, String imageName) async{
    Image image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(), 
        fit:BoxFit.scaleDown,
      );
    });
    return image;
  }
}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
