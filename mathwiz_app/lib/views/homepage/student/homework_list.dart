import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:mathwiz_app/views/homework/assigned_homework.dart';
import 'package:provider/provider.dart';

class HomeworkList extends StatefulWidget {
  @override
  _HomeworkListState createState() => _HomeworkListState();
}

class _HomeworkListState extends State<HomeworkList> {
  @override
  Widget build(BuildContext context) {
    
   final homeworkList = Provider.of<List<HomeworkModel>>(context) ?? [];

    return Expanded(
      child: ListView.builder(
      itemCount: homeworkList.length,
      itemBuilder: (context, index) {
         if (homeworkList[index].status == ""){
           return null;
         }
         else if(homeworkList[index].status == "Published"){
           return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: Text('${homeworkList[index].title}'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.7),
                        onPrimary: Colors.black,
                      ),
                    onPressed: () {
                    },
                ),
                ),
              ),
            ]
          );
        }else{
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: Text('${homeworkList[index].title}'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AssignedHomeworkScreen();
                          },
                        ),
                      );
                    },
                ),
                ),
              ),
            ]
          );
        }
      },
      ),
    );
  }
}