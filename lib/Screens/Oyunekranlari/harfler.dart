// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_child_quiz/Data/data4.dart';
import 'package:flutter_child_quiz/Model/question_model4.dart';
import 'package:flutter_child_quiz/Screens/result1.dart';

class Harfler extends StatefulWidget {
  @override
  _HarflerState createState() => _HarflerState();
}

class _HarflerState extends State<Harfler> with SingleTickerProviderStateMixin {
  List<QuestionModel4> questions4 = <QuestionModel4>[];
  int index = 0;
  int points = 0;
  int correct = 0;
  int incorrect = 0;

  AnimationController? controller;

  Animation? animation;

  double beginAnim = 0.0;

  double endAnim = 1.0;

  @override
  void initState() {
    super.initState();

    questions4 = getQuestion4()!;

    controller =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller!)
      ..addListener(() {
        setState(() {
          // Change here any Animation object value.
        });
      });

    startProgress();

    animation!.addStatusListener((AnimationStatus animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        if (index < questions4.length - 1) {
          index++;
          resetProgress();
          startProgress();
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Result1(
                        score: points,
                        totalQuestion: questions4.length,
                        correct: correct,
                        incorrect: incorrect,
                      )));
        }
      }
    });
  }

  startProgress() {
    controller!.forward();
  }

  stopProgress() {
    controller!.stop();
  }

  resetProgress() {
    controller!.reset();
  }

  void nextQuestion() {
    if (index < questions4.length - 1) {
      index++;
      resetProgress();
      startProgress();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Result1(
                    score: points,
                    totalQuestion: questions4.length,
                    correct: correct,
                    incorrect: incorrect,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "${index + 1}/${questions4.length}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Soru",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "$points",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Puan",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              questions4[index].getQuestion4()! + "?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: LinearProgressIndicator(
                value: animation!.value,
              ),
            ),
            CachedNetworkImage(
              imageUrl: questions4[index].getImageUrl4()!,
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print(questions4[index].getAnswwer4());
                      questions4.forEach((element) {
                        print(element.toString());
                      });
                      if (questions4[index].getAnswwer4() == "Do??ru") {
                        setState(() {
                          points = points + 10;

                          nextQuestion();
                          correct++;
                        });
                      } else {
                        setState(() {
                          points = points - 5;

                          nextQuestion();
                          incorrect++;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Do??ru",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (questions4[index].getAnswwer4() == "Yanl????") {
                        setState(() {
                          points = points + 10;
                          nextQuestion();
                          correct++;
                        });
                      } else {
                        setState(() {
                          points = points - 5;
                          nextQuestion();
                          incorrect++;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Yanl????",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }
}
