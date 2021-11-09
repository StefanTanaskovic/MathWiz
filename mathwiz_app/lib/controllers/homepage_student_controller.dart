import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/model/trivia_model.dart';

class HomepageStudentController {

  String classID = 'Ppipys4C6HhPXSoWbRvs';
  
  //get triva quizzes 
  Stream<List<TriviaModel>> get triviaList{
    CollectionReference triviaListCollection = FirebaseFirestore.instance.collection('classrooms')
    .doc(classID).collection('trivias');

    return triviaListCollection.snapshots().map(_triviaList);
  }

  List<TriviaModel> _triviaList (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      List<QuestionAnswerModel> triviaQuestions = [];

      doc.data()['questions'].forEach((element){
        triviaQuestions.add(
          QuestionAnswerModel(
            question: element['question'],
            answers: element['answers'],
            correctAnswer: element['correct_answer']
          )
        );
        });
      return TriviaModel(
        id: doc.id,
        title: doc.data()['trivia_title'] ,
        questions: triviaQuestions,
        minReward: doc.data()['trivia_min_reward'],
        firstReward: doc.data()['trivia_first_reward'],
        status: doc.data()['trivia_status'],
        timer: doc.data()['trivia_timer'],
        published:doc.data()['trivia_published']
      );
    }).toList();
  }

  //get race quizzes 
    Stream<List<RaceTopModel>> get raceList{
    CollectionReference raceListCollection = FirebaseFirestore.instance.collection('classrooms')
    .doc(classID).collection('races');
    return raceListCollection.snapshots().map(_raceList);
  }

  List<RaceTopModel> _raceList (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      List<QuestionAnswerModel> raceQuestions = [];

      doc.data()['race_questions'].forEach((element){
        raceQuestions.add(
          QuestionAnswerModel(
            question: element['question'],
            answers: element['answers'],
            correctAnswer: element['correct_answer']
          )
        );
        });
      return RaceTopModel(
        id: doc.id,
        title: doc.data()['race_title'] ,
        questions: raceQuestions,
        minReward: doc.data()['race_min_reward'],
        firstReward: doc.data()['race_first_reward'],
        status: doc.data()['race_status'],
        published:doc.data()['race_published']
      );
    }).toList();
  }

  //get asteroids quizzes 
  Stream<List<AsteroidModel>> get asteroidsList{
    CollectionReference asteroidsListCollection = FirebaseFirestore.instance.collection('classrooms')
    .doc(classID).collection('asteroids');

    return asteroidsListCollection.snapshots().map(_asteroidsList);
  }

  List<AsteroidModel> _asteroidsList (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      List<QuestionAnswerModel> asteroidQuestions = [];

      doc.data()['questions'].forEach((element){
        asteroidQuestions.add(
          QuestionAnswerModel(
            question: element['question'],
            answers: element['answers'],
            correctAnswer: element['correct_answer'],
          )
          
        );
        print(asteroidQuestions[0].correctAnswer);
        });
      return AsteroidModel(
        id: doc.id,
        title: doc.data()['asteroid_title'] ,
        questions: asteroidQuestions,
        reward: doc.data()['asteroid_reward'],
        status: doc.data()['asteroid_status'],
        timer: doc.data()['asteroid_timer'],
        published:doc.data()['asteroid_published'],
        lives :doc.data()['asteroid_lives']
      );
    }).toList();
  }
}
