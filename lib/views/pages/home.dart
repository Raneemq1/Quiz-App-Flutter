import 'package:flutter/material.dart';
import 'package:task_quiz_app/models/answer.dart';
import 'package:task_quiz_app/models/questions_answers.dart';
import 'package:task_quiz_app/utils/app_color.dart';


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<QuestionsAnswers> questionsWithAnswers = QuestionsAnswers.dummyData();

  bool isSelected = false;
  bool isMoved = false;
  bool isViewed = false;
  int questionIndex = 0;
  int selectedChoice = -1;
  int score = 0;
  Color color = AppColor.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: !isMoved
              ? Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //display questions and answers
                      children: [
                        Text(
                          questionsWithAnswers[questionIndex].question,
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Answer and get points!',
                          style: TextStyle(color: AppColor.grey, fontSize: 13),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text(
                            'Setp ${questionIndex + 1}',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(' of ${questionsWithAnswers.length}',
                              style: TextStyle(
                                  color: AppColor.grey, fontSize: 13)),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        LinearProgressIndicator(
                          value: (questionIndex.toDouble() /
                                  questionsWithAnswers.length.toDouble()) +
                              (1/questionsWithAnswers.length.toDouble()),
                          backgroundColor: Colors.grey,
                          minHeight: 10,
                          color: AppColor.green,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: (questionsWithAnswers[questionIndex].answers
                                  as List<Answer>)
                              .asMap()
                              .map((index, answer) {
                                return MapEntry(
                                  index,
                                  AnswerBox(answer.tittle, answer.icon, () {
                                    setState(
                                      () {
                                        selectedChoice = index;
                                      },
                                    );
                                  }, selectedChoice == index),
                                );
                              })
                              .values
                              .toList(),
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    ///add conditions to the second part
                                    if (selectedChoice == -1) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.blue,
                                        content:
                                            Text('Please choose an answer!'),
                                        duration: Duration(seconds: 1),
                                      ));
                                      debugPrint('Please choose a choice');
                                    } else {
                                      if (questionsWithAnswers[questionIndex]
                                              .correct ==
                                          questionsWithAnswers[questionIndex]
                                              .answers[selectedChoice]
                                              .tittle) {
                                        score++;
                                      }
                                      if (questionIndex <
                                          questionsWithAnswers.length - 1) {
                                        questionIndex++;
                                        selectedChoice = -1;
                                      } else {
                                        isMoved = true;
                                        selectedChoice = -1;
                                      }
                                    }
                                  });
                                },
                                child: Text('Next'))),
                      ]),
                )
              : !isViewed
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        //display result and reset the quiz
                        children: [
                          Text(
                            'Congrats',
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isViewed = true;
                              });
                            },
                            child: Text(
                              'Score: ${score}/${questionsWithAnswers.length}',
                              style: TextStyle(
                                  color: AppColor.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMoved = false;
                                questionIndex = 0;
                                score = 0;
                              });
                            },
                            child: Text(
                              'repeat quiz',
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: questionsWithAnswers.map((question) {
                              return Column(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    question.question,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: (question.answers as List<Answer>)
                                        .asMap()
                                        .map((index, answer) {
                                          return MapEntry(
                                            index,
                                            Text(
                                                '${index + 1})\t${answer.tittle}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: answer.tittle ==
                                                            question.correct
                                                        ? AppColor.green
                                                        : AppColor.black)),
                                          );
                                        })
                                        .values
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.black),
                                onPressed: () {
                                  setState(() {
                                    isViewed = false;
                                  });
                                },
                                child: Text('Prev')),
                          )
                        ],
                      ),
                    )),
    );
  }
}


/**
 * Function Button of the answer button 
 */
Widget AnswerBox(
    String text, IconData icon, VoidCallback onPress, bool isSelected,
    [Color baseColor = AppColor.white]) {
  Color color = isSelected ? AppColor.blue : baseColor;
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          border: Border.all(
              style: BorderStyle.solid, width: 1, color: AppColor.black),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 20,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    ),
  );
}
