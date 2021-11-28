import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/r2t_quiz.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/rtt_wrapper.dart';
import 'package:provider/provider.dart';

class RaceList extends StatefulWidget {
  @override
  _RaceListState createState() => _RaceListState();
}

class _RaceListState extends State<RaceList> {
  @override
  Widget build(BuildContext context) {
    
   final raceList = Provider.of<List<RaceTopModel>>(context) ?? [];

    return Expanded(
      child: ListView.builder(
      itemCount: raceList.length,
      itemBuilder: (context, index) {
         if (raceList[index].published == false){
           return null;
         }
         else if(raceList[index].status == "Start Time"){
           return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: Text('${raceList[index].title}'),
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
                    child: Text('${raceList[index].title}'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RaceWrapper(quiz: raceList[index], index: index);
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