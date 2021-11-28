import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/model/firebasefile_model.dart';
import 'package:mathwiz_app/views/imagepage/image_page.dart';


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
    final ref = storage.ref().child("homework/HW1");
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

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Completed Homeworks",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.025,
              color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
           Text("All Homeworks",
        style: TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.022,
              )),
              ],),
            ),
            Container(height: size.height*0.7,
            width: size.width,
                padding: const EdgeInsets.all(5),
                child: Row(
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
                              return Expanded(child: ListView.builder(
                                    itemBuilder: (context, index){
                                      final file = files[index];
                                      return buildFile(context,file);
                                    },
                                    itemCount: files.length,
                                    ));
                              }
                          }
                        })
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


    Widget buildFile(BuildContext context, FirebaseFile file) => Card(child: ListTile(
      title: Text(
        file.name,
        style: TextStyle(fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: kPrimaryColor,
        ),
      ),
      trailing: Image.network(
        file.url,
        width:100,
        height: 100,
        fit:BoxFit.cover
        ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImagePage(file:file),
    )),
    ));


}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}


