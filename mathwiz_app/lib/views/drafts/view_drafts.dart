import 'package:flutter/material.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/text_field_container.dart';

import '../../constants.dart';

class ViewDraftsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ViewDraftsScreenState();
      }
    }
    

class _ViewDraftsScreenState extends State<ViewDraftsScreen> {
  final List<String> classList = <String>['Homework #2 Draft', 'R2P Draft', 'Math Quiz Draft'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
      title:Text(
              "Drafts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.025,color: Colors.black),
            ),
      ),
      body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: classList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
              height: size.height * 0.08,
              margin: EdgeInsets.all(3),
              child:Row(children: [            
              Expanded(
                  flex: 5,
                  child: Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${classList[index]}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.02))
                  ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(
                    icon: Icon(Icons.edit, color:Colors.blue),
                    onPressed: () {},
                    )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(
                    icon: Icon(Icons.check_box, color:Colors.green),
                    onPressed: () {},
                    )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(
                    icon: Icon(Icons.delete_rounded,color:Colors.red),
                    onPressed: () {},
                    )
                    ],
                  ),
                ),
              )
              ],
              )
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
            ));
  }
}