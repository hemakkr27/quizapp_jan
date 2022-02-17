//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/controllers/question_controller.dart';
// ignore: unused_import
import 'package:testing/screens/quiz/quiz_screen.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
// import 'package:quiz_app/constants.dart';
// import 'package:quiz_app/controllers/question_controller.dart';

//String Backid = "https://kurukshetra.gov.in/brahmasarovar/";

class ScoreScreen extends StatelessWidget {
  String id;
  String totalqueston;
  String score;
  String backid;
  ScoreScreen(this.totalqueston, this.score, this.id, this.backid);
  @override
  Widget build(BuildContext context) {
//    QuestionController _qnController = Get.put(QuestionController());
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
              const Spacer(), // 1/6
              //Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: InkWell(
              //     onTap:
              //         //_launchURLApp,
              //         () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => QuizScreen(id)));
              //     },
              //     child: Container(
              //       width: double.infinity,
              //       alignment: Alignment.center,
              //       padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
              //       decoration: const BoxDecoration(
              //         gradient: kPrimaryGradient,
              //         borderRadius: BorderRadius.all(Radius.circular(12)),
              //       ),
              //       child: Text(
              //         "Start Again Quiz",
              //         style: Theme.of(context)
              //             .textTheme
              //             .button
              //             ?.copyWith(color: Colors.black),
              //       ),
              //     ),
              //   ),
              // ),

              Container(
                width: double.infinity,
                alignment: Alignment.center,

                padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                decoration: const BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: ElevatedButton(
                  onPressed: _launchURL(backid),
                  child: Text(
                    "Start Again Quiz",
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.black,
                        ),
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

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}



//flutter doctor -v
//flutter run --enable-software-rendering