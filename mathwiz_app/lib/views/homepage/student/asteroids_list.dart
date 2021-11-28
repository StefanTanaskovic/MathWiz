import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/views/trivia/asteroids/asteroids_quiz.dart';
import 'package:mathwiz_app/views/trivia/asteroids/asteroids_wrapper.dart';
import 'package:provider/provider.dart';

class AsteroidsList extends StatefulWidget {
  @override
  _AsteroidsListState createState() => _AsteroidsListState();
}

class _AsteroidsListState extends State<AsteroidsList> {
  @override
  Widget build(BuildContext context) {
    
   final asteroidList = Provider.of<List<AsteroidModel>>(context) ?? [];

    return Expanded(
      child: ListView.builder(
      itemCount: asteroidList.length,
      itemBuilder: (context, index) {
        if (asteroidList[index].published == false){
           return null;
         }
         else if(asteroidList[index].status == "Start Time"){
           return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: Text('${asteroidList[index].title}'),
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
                    child: Text('${asteroidList[index].title}'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AsteroidsWrapper(quiz: asteroidList[index]);
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