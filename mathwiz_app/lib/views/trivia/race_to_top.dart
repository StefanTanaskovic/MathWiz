import 'package:flutter/material.dart';
import 'package:mathwiz_app/widgets/answer_question.dart';

import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/box_pass_field.dart';
import 'package:mathwiz_app/widgets/trivia_answer_box.dart';
import 'package:mathwiz_app/widgets/trivia_question_box.dart';

import '../../constants.dart';

class RaceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RaceScreenState();
  }
}

//final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

List<TrivaQuestionAnswer> questions = [TrivaQuestionAnswer(answers: ["omg lol"], question: "duuude cmon"),TrivaQuestionAnswer(answers: ["omg lol"], question: "wtf")];

class _RaceScreenState extends State<RaceScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
        
    return Scaffold(
        appBar: AppBar(
        title: const Text('Race to the Top Creator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Question',
            onPressed: () {
              for(var i = 0; i < questions.length; i++){
                questions[i].isExpanded = false;
              }
              questions.add(TrivaQuestionAnswer(
                question: "",
                answers: [""]
              ));
              setState(() {
                
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BoxInputFeild(
              hintText: "Quiz Title",
              icon: Icons.title_rounded,
              onChanged: (value) {},
            ),    
            _buildPanel(),
            ],    
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          questions[index].isExpanded = !isExpanded;
        });
        
      },
      children: questions.map<ExpansionPanel>((TrivaQuestionAnswer item) {
        
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            
            return ListTile(
              title:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      questions.removeAt(questions.indexOf(item));
                      print(item.question);
                      setState(() {
                      });
                    }),
                  Expanded(
                    child: TriviaQuestionBox(
                  ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getTriviaAnswerBox(item.answers),
                IconButton(
                 icon: const Icon(Icons.add),
                 onPressed: () {
                   item.answers.add("");
                   getTriviaAnswerBox(item.answers);
                  setState(() {
                    
                  });
                 })
                ])
            ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
      
    );
  }
}

 Widget getTriviaAnswerBox (List<String> strings)
  {
    return new Column(children: strings.map((item) => new TriviaAnswerBox()).toList());
  }



