import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/controllers/question_controller.dart';
import 'package:testing/screens/quiz/quiz_screen.dart';

import '../../constants.dart';
// import 'package:quiz_app/constants.dart';
// import 'package:quiz_app/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  String totalqueston;
  String score;
  ScoreScreen(this.totalqueston, this.score);
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bgimg.JPG",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                // "${_qnController.numOfCorrectAns}/${_qnController.questions.length}",
                // "/${_questions.length.toString()}",
                "${score}/${totalqueston}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(), // 1/6
              InkWell(
                onTap: () {fl},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                  decoration: const BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    "Lets Start Quiz",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

//flutter doctor -v
//flutter run --enable-software-rendering