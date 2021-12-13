import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/homepage_teacher_controller.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:mathwiz_app/views/homework/publish_homework.dart';
import 'package:provider/provider.dart';

class HomeworkList extends StatefulWidget {
  @override
  _HomeworkListState createState() => _HomeworkListState();
}

class _HomeworkListState extends State<HomeworkList> {
  @override
  Widget build(BuildContext context) {
    
   final homeworkList = Provider.of<List<HomeworkModel>>(context) ?? [];

    return             Expanded(
              child: ListView.builder(
                itemCount: homeworkList.length,
                itemBuilder: (context, index) {
                  if(homeworkList[index].published == true){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${homeworkList[index].id}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                
                              },
                          ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            child: Text('Unpublish'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                            onPressed: () {
                              HomepageTeacherController().changeStatusHomework("Drafts",homeworkList[index].id);
                              
                            },
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child:Icon(Icons.delete),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                context.read<HomeworkListNotifier>().deleteHomework(homeworkList[index].id);
                              },
                            ),
                          ),
                      ]
                    );
                  }else {
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
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child: Text('Publish'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                HomepageTeacherController().changeStatusHomework("Publish",homeworkList[index].id);

                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child: Icon(Icons.delete),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                context.read<HomeworkListNotifier>().deleteHomework(index);
                              },
                            ),
                          ),
                        ]
                  );
                  }
                }
            ),
            );
  }
}