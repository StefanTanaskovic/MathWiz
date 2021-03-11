import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathwiz_app/widgets/answer_question.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/custom_slider.dart';
import '../../constants.dart';

class RaceScreen extends StatefulWidget {
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;
  RaceScreen({this.amountQuestions, this.amountAnswers, this.quizTitle});

  @override
  State<StatefulWidget> createState() {
    return _RaceScreenState(amountAnswers: amountAnswers, amountQuestions: amountQuestions, quizTitle: quizTitle);
  }
}

List<TrivaQuestionAnswer> questions = [];
List<Widget> children;
class _RaceScreenState extends State<RaceScreen> {
  final int amountQuestions;
  final int amountAnswers;
  final String quizTitle;
  final _formKey = GlobalKey<FormState>();

  _RaceScreenState({this.amountQuestions, this.amountAnswers,this.quizTitle});

  @override
  Widget build(BuildContext context) {

    questions = List.generate(
    amountQuestions,
    (int i) =>TrivaQuestionAnswer(id: i,
                question: "",
                answers: [])); 
     
    return Scaffold(
        appBar: AppBar(
          backgroundColor: teal,
        title: const Text('Race to the Top Creator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save Quiz',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                for(var i = 0; i < questions.length; i++){
                    print("-------------");
                    print(questions[i].question);
                    print(questions[i].answers);
                    print("-------------");
                }
              }

              setState(() {
                
              });
            },
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
                  _buildPanel(),  
              ),
            )
          ]
        )
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          questions[index].isExpanded = !isExpanded;  
        });
      },
      children: questions.map<ExpansionPanelRadio>((TrivaQuestionAnswer item) {
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
                padding: EdgeInsets.only(top:10.0),
                child:Text("-", style: TextStyle(color: Colors.black)),
              ),
              hintText: "Enter Answer",
              border: InputBorder.none,
            ),)
            )
          ),
        )
        );
      }).toList(),
    );
  }
}
