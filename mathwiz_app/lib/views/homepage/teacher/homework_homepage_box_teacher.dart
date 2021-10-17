import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/homepage_teacher_controller.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:mathwiz_app/views/homework/publish_homework.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class HomeworkHomepageBoxTeacher extends StatefulWidget {
  @override
  _HomeworkHomepageBoxTeacherState createState() => _HomeworkHomepageBoxTeacherState();
}

class _HomeworkHomepageBoxTeacherState extends State<HomeworkHomepageBoxTeacher> {
  @override
  Widget build(BuildContext context) {
    final homeworkList = Provider.of<List<HomeworkModel>>(context) ?? [];
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
            ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Homework Check',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),

            Expanded(
              child: ListView.builder(
                itemCount: context.watch<HomeworkListNotifier>().homeworksList.length,
                itemBuilder: (context, index) {
                  if(homeworkList[index].published == true){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${context.watch<HomeworkListNotifier>().homeworksList[index].title}'),
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
                                context.read<HomeworkListNotifier>().deleteHomework(index);
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
                                child: Text('${homeworkList[index].id}'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white.withOpacity(0.7),
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PublishHomeworkScreen(homework: homeworkList[index]);
                                    },
                                  ),
                                );
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
            ),
            SizedBox(height: 10),
          ],
        )
    );
  }
}
