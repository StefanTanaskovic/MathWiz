import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathwiz_app/controllers/race_to_top_creator_notifier.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';

class RaceScreen extends StatefulWidget {
  final int goldFirst;
  final int goldMin;
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;

  RaceScreen({this.amountQuestions, this.amountAnswers, this.quizTitle, this.goldFirst, this.goldMin});

  @override
  State<StatefulWidget> createState() {
    return _RaceScreenState(
      amountAnswers: amountAnswers, 
      amountQuestions: amountQuestions, 
      quizTitle: quizTitle, 
      goldFirst:goldFirst, 
      goldMin: goldMin
    );
  }
}

List<Widget> children;

class _RaceScreenState extends State<RaceScreen> {
  Map selected = new Map();
  final int goldFirst;
  final int goldMin;
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;
  final _formKey = GlobalKey<FormState>();
  
  _RaceScreenState({this.amountQuestions, 
                    this.amountAnswers,
                    this.quizTitle, 
                    this.goldFirst, 
                    this.goldMin});

  @override
  Widget build(BuildContext context) {

  RaceListNotifier raceListNotifier =
         Provider.of<RaceListNotifier>(context,listen: false);
FirestoreDatabaseService fsDatabase =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    raceListNotifier.setQuestions(amountQuestions);
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Race to the Top Creator'),
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
                  raceListNotifier.setCorrectAns(raceListNotifier.questions);
                  raceListNotifier.save(
                    value, 
                    RaceTopModel(
                      status: "Waiting",
                    title: quizTitle, 
                    questions: raceListNotifier.questions,
                    minReward: goldMin,
                    firstReward: goldFirst),
                    fsDatabase.classID
                  );
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
    RaceListNotifier raceListNotifier =
         Provider.of<RaceListNotifier>(context);
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 0,
      expansionCallback: (int index, bool isExpanded) {
        raceListNotifier.expansion(raceListNotifier.questions[index], isExpanded);
      },
      children: raceListNotifier.questions.map<ExpansionPanelRadio>((QuestionAnswerModel item) {
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
                  groupValue: raceListNotifier.selected[item.id] != null ? raceListNotifier.selected[item.id] : "",
                  onChanged: (value) {
                    raceListNotifier.radioValueChanged(item.id, value);
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




