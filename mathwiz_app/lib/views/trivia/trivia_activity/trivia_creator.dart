import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathwiz_app/controllers/trivia_activity_notifier.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';

class TriviaScreen extends StatefulWidget {
  final int timer;
  final int goldFirst;
  final int goldMin;
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;

  TriviaScreen({this.timer, this.amountQuestions, this.amountAnswers, this.quizTitle, this.goldFirst, this.goldMin});

  @override
  State<StatefulWidget> createState() {
    return _TriviaScreenState(
      amountAnswers: amountAnswers, 
      amountQuestions: amountQuestions, 
      quizTitle: quizTitle, 
      goldFirst:goldFirst, 
      goldMin: goldMin,
      timer: timer
    );
  }
}

List<Widget> children;

class _TriviaScreenState extends State<TriviaScreen> {
  final int timer;
  final int goldFirst;
  final int goldMin;
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;
  final _formKey = GlobalKey<FormState>();
  
  _TriviaScreenState({this.amountQuestions, 
                    this.amountAnswers,
                    this.quizTitle, 
                    this.goldFirst, 
                    this.goldMin,
                    this.timer});

  @override
  Widget build(BuildContext context) {

  TriviaListNotifier triviaListNotifier =
         Provider.of<TriviaListNotifier>(context,listen: false);

    triviaListNotifier.setQuestions(amountQuestions);
     
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
                  triviaListNotifier.setCorrectAns(triviaListNotifier.questions);
                  triviaListNotifier.save(
                    value, 
                    TriviaModel(
                    id: "OCgLkR3W9j32lnFUhW4x",
                    title: quizTitle, 
                    questions: triviaListNotifier.questions,
                    minReward: goldMin,
                    firstReward: goldFirst,
                    timer: timer)
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
    TriviaListNotifier triviaListNotifier =
         Provider.of<TriviaListNotifier>(context);
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 0,
      expansionCallback: (int index, bool isExpanded) {
        triviaListNotifier.expansion(triviaListNotifier.questions[index], isExpanded);
      },
      children: triviaListNotifier.questions.map<ExpansionPanelRadio>((QuestionAnswer item) {
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
                  groupValue: triviaListNotifier.selected[item.id] != null ? triviaListNotifier.selected[item.id] : "",
                  onChanged: (value) {
                    triviaListNotifier.radioValueChanged(item.id, value);
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




