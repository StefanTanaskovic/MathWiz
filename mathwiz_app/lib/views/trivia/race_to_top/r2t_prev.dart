import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/race_to_top_creator.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/custom_slider.dart';
import 'package:mathwiz_app/widgets/text_field_container.dart';
import '../../../constants.dart';

class RaceScreenPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RaceScreenPickerState();
  }
}

class _RaceScreenPickerState extends State<RaceScreenPicker> {
  double _currentSliderValueQuestions = 4;
  double _currentSliderValueAnswers = 4;
  double _currentSliderValueMinReward = 25;
  double _currentSliderValueFirstPlaceReward = 40;
  final quizTitleController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
     
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
        title: const Text('Race to the Top Creator'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFeildContainer(
                  child: TextField(
                    controller: quizTitleController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.title_rounded,
                        color: kPrimaryColor,
                      ),
                      hintText: "Quiz Title",
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8 ,
                  height: (95),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      Radius.circular((15)),
                    ),
                    gradient: new LinearGradient(
                    colors: [
                      kPrimaryColor,
                      kPrimaryLightColor,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.00),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                  ),
                  child: 
                  Padding(
                    padding: EdgeInsets.fromLTRB(10 * 2.0,
                        2, 10 * 2.0, 2),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text("Amount of questions",
                        style: TextStyle( fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text('2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700  
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Expanded(
                            child: Center(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: kSecondaryColor,
                                  inactiveTrackColor: kSecondaryColor.withOpacity(.5),
                                  trackHeight: 4.0,
                                  thumbShape: CustomSliderThumbCircle(
                                    thumbRadius: 50 * .4,
                                    min: 2,
                                    max: 8,
                                  ),
                                ),
                                child: Slider(
                                    min: 2,
                                    max: 8,
                                    //divisions: 8,
                                    value: _currentSliderValueQuestions,
                                    onChanged: (value) {
                                      setState(() {
                                        _currentSliderValueQuestions = value;
                                      });
                                    }),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700  
                              ),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8 ,
                  height: (95),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      Radius.circular((15)),
                    ),
                    color: kPrimaryColor,
                    gradient: new LinearGradient(
                      colors: [
                      kPrimaryColor,
                      kPrimaryLightColor,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.00),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  ),
                  child: 
                  Padding(
                    padding: EdgeInsets.fromLTRB(10 * 2.0,
                        2, 10 * 2.0, 2),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text("Answers per question",
                        style: TextStyle( fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text('2', textAlign: TextAlign.center, style: 
                            TextStyle(fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700 )
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Expanded(
                            child: Center(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: kSecondaryColor,
                                  inactiveTrackColor: kSecondaryColor.withOpacity(.5),
                                  trackHeight: 4.0,
                                  thumbShape: CustomSliderThumbCircle(
                                    thumbRadius: 50 * .4,
                                    min: 2,
                                    max: 4,
                                  ),
                                ),
                                child: Slider(
                                    min: 2,
                                    max: 4,
                                    //divisions: 2,
                                    value: _currentSliderValueAnswers,
                                    onChanged: (value) {
                                      setState(() {
                                        _currentSliderValueAnswers = value;
                                      });
                                    }),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Text('4', textAlign: TextAlign.center, 
                            style: TextStyle(fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8 ,
                  height: (95),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      Radius.circular((15)),
                    ),
                    gradient: new LinearGradient(
                    colors: [
                      goldColorGold,
                      goldColorGoldlight,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.00),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                  ),
                  child: 
                  Padding(
                    padding: EdgeInsets.fromLTRB(10 * 2.0,
                        2, 10 * 2.0, 2),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text("Gold for Participating",
                        style: TextStyle( fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text('10',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700  
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Expanded(
                            child: Center(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: kSecondaryColor,
                                  inactiveTrackColor: kSecondaryColor.withOpacity(.5),
                                  trackHeight: 4.0,
                                  thumbShape: CustomSliderThumbCircle(
                                    thumbRadius: 50 * .4,
                                    min: 10,
                                    max: 50,
                                  ),
                                ),
                                child: Slider(
                                    min: 10,
                                    max: 50,
                                    //divisions: 40,
                                    value: _currentSliderValueMinReward,
                                    onChanged: (value) {
                                      setState(() {
                                        _currentSliderValueMinReward = value;
                                      });
                                    }),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Text(
                            '50',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700  
                              ),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8 ,
                  height: (95),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      Radius.circular((15)),
                    ),
                    gradient: new LinearGradient(
                    colors: [
                      goldColorGold,
                      goldColorGoldlight,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.00),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                  ),
                  child: 
                  Padding(
                    padding: EdgeInsets.fromLTRB(10 * 2.0,
                        2, 10 * 2.0, 2),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text("Gold for Placing in First Place",
                        style: TextStyle( fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text('10',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700  
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Expanded(
                            child: Center(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: kSecondaryColor,
                                  inactiveTrackColor: kSecondaryColor.withOpacity(.5),
                                  trackHeight: 4.0,
                                  thumbShape: CustomSliderThumbCircle(
                                    thumbRadius: 50 * .4,
                                    min: 10,
                                    max: 50,
                                  ),
                                ),
                                child: Slider(
                                    min: 10,
                                    max: 50,
                                    //divisions: 40,
                                    value: _currentSliderValueFirstPlaceReward,
                                    onChanged: (value) {
                                      setState(() {
                                        _currentSliderValueFirstPlaceReward = value;
                                      });
                                    }),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60 * .1,
                          ),
                          Text(
                            '50',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,  color: Colors.grey[900],fontWeight: FontWeight.w700  
                              ),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                BoxButton(
                  text: "Next",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RaceScreen(
                            amountAnswers:_currentSliderValueAnswers.round(),
                            amountQuestions: _currentSliderValueQuestions.round(), 
                            quizTitle:quizTitleController.text,
                            goldFirst: _currentSliderValueFirstPlaceReward.round(),
                            goldMin: _currentSliderValueMinReward.round(),
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding:EdgeInsets.only(left: 16, right: 16),
                  child:  Text('*Please make sure these values are correct as you will not be able to change them.', 
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,  color: Colors.black,fontWeight: FontWeight.w300),
                  )
              )
              ],    
            ),
          ),
        ),
      )
    );
  }
}











