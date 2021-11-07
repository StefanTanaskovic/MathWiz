import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/firebasefile_model.dart';
import 'package:mathwiz_app/views/homework/completed_homework.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key key,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(file.name),
    centerTitle: true,
    actions: [
      IconButton(icon: Icon(Icons.file_download),
      onPressed: () async {
        await CompletedHomeworkScreen.saveImage(file.url);
        final snackBar = SnackBar(content: Text('Downloaded ${file.name}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
