import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_quiz_screen.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_wrapper.dart';
import 'package:provider/provider.dart';

class TriviaList extends StatefulWidget {
  @override
  _TriviaListState createState() => _TriviaListState();
}

class _TriviaListState extends State<TriviaList> {
  @override
  Widget build(BuildContext context) {
    
   final triviaList = Provider.of<List<TriviaModel>>(context) ?? [];

    return Expanded(
      child: ListView.builder(
      itemCount: triviaList.length,
      itemBuilder: (context, index) {
        if (triviaList[index].published == false){
           return null;
         }
         else if(triviaList[index].status == "Start Time"){
           return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: Text('${triviaList[index].title}'),
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
                    child: Text('${triviaList[index].title}'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TriviaWrapper(quiz: triviaList[index],index:index );
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