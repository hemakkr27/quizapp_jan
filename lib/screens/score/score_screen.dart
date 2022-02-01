import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/controllers/question_controller.dart';

import '../../constants.dart';
// import 'package:quiz_app/constants.dart';
// import 'package:quiz_app/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
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
                "${1 / 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
