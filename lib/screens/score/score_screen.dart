//import 'dart:html';

// ignore_for_file: unnecessary_brace_in_string_interps

//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:testing/controllers/question_controller.dart';
// ignore: unused_import
//import 'package:testing/screens/quiz/quiz_screen.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

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
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${score}/${totalqueston}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(), // 1/6

              Container(
                width: double.infinity,
                alignment: Alignment.center,

                padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                decoration: const BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: ElevatedButton(
                    child: Text(
                      "Start Again Quiz",
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    onPressed: _launchURL(backid)
                    // {
                    //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    // },
                    ),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    //window.close();
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}




//flutter doctor -v
//flutter run --enable-software-rendering