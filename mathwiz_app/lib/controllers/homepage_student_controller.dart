import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/homework_model.dart';
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
    CollectionReference triviaListCollection = FirebaseFirestore.instance.collection('classrooms')
    .doc(classID).collection('races');
    return triviaListCollection.snapshots().map(_raceList);
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

     Stream<List<HomeworkModel>> get homeworksList{
    CollectionReference homeworkListCollection = FirebaseFirestore.instance.collection('classrooms')
    .doc(classID).collection('homeworks');
    return homeworkListCollection.snapshots().map(_homeworkList);
  }

  List<HomeworkModel> _homeworkList (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return HomeworkModel(
        id: doc.id,
        title: doc.data()['homework_title'] ,
        ocrtext: doc.data()['homework_text'],
        description: doc.data()['homework_description'],
        gold: doc.data()['homework_gold'],
        status: doc.data()['homework_status'],
        published:doc.data()['homework_published']
      );
    }).toList();
  }
}
