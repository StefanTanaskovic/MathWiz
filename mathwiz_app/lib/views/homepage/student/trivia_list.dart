import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_quiz_screen.dart';

class TriviaList extends StatefulWidget {
  @override
  _TriviaListState createState() => _TriviaListState();
}

class _TriviaListState extends State<TriviaList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference trivia = FirebaseFirestore.instance.collection('classrooms').doc("EUYxFs74abDmqMHLSKcv").collection("trivias");

    return StreamBuilder<QuerySnapshot>(
      stream: trivia.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Expanded(
          child: ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                if(document.data()['trivia_published'] == true){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${document.data()['trivia_title']}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TriviaQuizScreen();
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
              }).toList(),
            )
        );
      }
    );
  }
}


