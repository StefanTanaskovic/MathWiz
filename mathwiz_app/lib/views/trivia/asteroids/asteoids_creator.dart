import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathwiz_app/controllers/asteroid_notifier.dart';
import 'package:mathwiz_app/controllers/trivia_activity_notifier.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';

class AsteroidQuestions extends StatefulWidget {
  final int timer;
  final int reward;
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;
  final int lives;

  AsteroidQuestions({this.timer, this.amountQuestions, this.amountAnswers, this.quizTitle, this.reward, this.lives});

  @override
  State<StatefulWidget> createState() {
    return _AsteroidQuestionsState(
      amountAnswers: amountAnswers, 
      amountQuestions: amountQuestions, 
      quizTitle: quizTitle, 
      reward:reward, 
      timer: timer,
      lives: lives,
    );
  }
}

List<Widget> children;

class _AsteroidQuestionsState extends State<AsteroidQuestions> {
  final int lives;
  final int timer;
  final int reward;
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;
  final _formKey = GlobalKey<FormState>();
  
  _AsteroidQuestionsState({this.amountQuestions, 
                    this.amountAnswers,
                    this.quizTitle, 
                    this.reward, 
                    this.timer, 
                    this.lives
                    });

  @override
  Widget build(BuildContext context) {

  AsteroidListNotifier asteroidListNotifier =
         Provider.of<AsteroidListNotifier>(context,listen: false);
FirestoreDatabaseService fsDatabase =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    asteroidListNotifier.setQuestions(amountQuestions);
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Trivia Creator'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: DropdownButton<String>(
              hint: Padding(padding: EdgeInsets.only(left: 5),
              child: Text("Save", style: TextStyle(color: Colors.white),)),
              icon: Padding(padding: EdgeInsets.only(right: 10),
              child: const Icon(Icons.save,  color: Colors.white)),
              iconSize: 22,
              elevation: 16,
              underline: Container(
                height: 2,
                color: kSecondaryColor,
              ),
              onChanged: (String value) {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  asteroidListNotifier.setCorrectAns(asteroidListNotifier.questions);
                  asteroidListNotifier.save(
                    value, 
                    AsteroidModel(
                    title: quizTitle, 
                    questions: asteroidListNotifier.questions,
                    reward: reward,
                    timer: timer,
                    lives: lives
                    ),

                  fsDatabase.classID);
                }
              },
              items: <String>['Publish', 'Drafts']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(quizTitle, textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 20,  color: Colors.grey[900],fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Container(
                child:
                  _buildCreator(),  
              ),
            )
          ]
        )
      ),
    );
  }

  Widget _buildCreator() {
    AsteroidListNotifier asteroidListNotifier =
         Provider.of<AsteroidListNotifier>(context);
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 0,
      expansionCallback: (int index, bool isExpanded) {
        asteroidListNotifier.expansion(asteroidListNotifier.questions[index], isExpanded);
      },
      children: asteroidListNotifier.questions.map<ExpansionPanelRadio>((QuestionAnswerModel item) {
        return ExpansionPanelRadio(
          value: item.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your question';
                  }
                  return null;
                },
                onSaved: (String value){
                  item.question = (value);
                },
                initialValue: item.question,
                onChanged: (text){
                  item.question = text;
                },
                decoration: InputDecoration(
                  hintText: "Enter Question",
                  border: InputBorder.none,
                ),
              ),
          );
        },
        body: ListTile(
          title: Column(children: List<Widget>.generate(amountAnswers, (i) => TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter an answer';
              }
              return null;
            },
            onSaved: (String value){
              item.answers.add(value);
            },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(right:10),
                child:
                Radio(
                  value: i, 
                  groupValue: asteroidListNotifier.selected[item.id] != null ? asteroidListNotifier.selected[item.id] : "",
                  onChanged: (value) {
                    asteroidListNotifier.radioValueChanged(item.id, value);
                  },
                )
              ),
              hintText: "Enter Answer",
              border: InputBorder.none,
            ),
            )
            )
          ),
        )
        );
      }).toList(),
    );
  }
}




