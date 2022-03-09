import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:testing/controllers/question_controller.dart';
//import 'package:testing/model/QuestionModel.dart';
//import 'package:testing/model/Questions.dart';

//import 'package:testing/screens/score/score_screen.dart';
import 'package:video_player/video_player.dart';
// import 'package:quiz_app/constants.dart';
// import 'package:quiz_app/controllers/question_controller.dart';

import '../../constants.dart';
import '../../controllers/question_controller.dart';
import '../../model/QuestionModel.dart';
import '../score/score_screen.dart';
import 'components/progress_bar.dart';

import 'package:http/http.dart' as http;

class QuizScreen extends StatelessWidget {
  String id;
  QuizScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
                child: Text(
              "QuizApp",
              style: TextStyle(),
            )),
          ),
        ],
      ),
      body: QuestionBody(id),
    );
  }
}

class QuestionBody extends StatefulWidget {
  String id;
  QuestionBody(this.id);
  @override
  State<QuestionBody> createState() => _BodyState();
}

class _BodyState extends State<QuestionBody> {
  late List<QuestinModel> _questions;

  int index = 0;
  int qoptionindex = 0; // click answer
  int _correctAns = 0; // match 1 = 1
  int _numcorrect = 0; // total corrt
  bool _answred = false; // green and red

  Future<List<QuestinModel>> getdata() async {
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbz_EM1r3Nh_XuzJigymZfhu0lyOIRDbxEfFM1tDI9bpHrgQ3ogz_x9KTRy300Uq95tekg/exec'));

    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      // QuestinModel.fromJson(json.decode(response.body)).toList();
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      _questions = parsed
          .map<QuestinModel>((json) => QuestinModel.fromJson(json)) // all
          .toList();
      if (widget.id != "null") {
        _questions = _questions
            .where((element) => element.qtype == widget.id)
            .toList(); // id match
      }
      return _questions;
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to load post');
    }
  }

  // var _visible1 = false;

  Color colortoshow1 = Colors.white;
  Color colortoshow2 = Colors.white;
  Color colortoshow3 = Colors.white;
  Color colortoshow4 = Colors.white;
  Color right = Colors.green;
  Color wrong = Colors.red;
  final nextprevi = true;

  // ignore: missing_return
  QuestionController _questionController = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller

    return Stack(
      children: [
        Image.asset(
          "assets/bgimg.JPG",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        FutureBuilder(
          future: getdata(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? SafeArea(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProgressBar(),
                        const SizedBox(height: kDefaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Question ${index + 1}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(color: kSecondaryColor),
                                children: [
                                  TextSpan(
                                    text: "/${_questions.length.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(color: kSecondaryColor),
                                  ),
                                ],
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: const Text(
                                  "Skip",
                                ),
                                onTap: () {
                                  changeQueston();
                                  _questionController.ResetPrograss();
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: const Icon(Icons.arrow_back_rounded),
                                onTap: () {
                                  setState(() {
                                    if (index != 0) {
                                      index--;
                                      _questionController.ResetPrograss();
                                    }
                                  });
                                },
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: const Icon(Icons.arrow_forward_rounded),
                                onTap: () {
                                  changeQueston();
                                  _questionController.ResetPrograss();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kGrayColor),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Flexible(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      _questions[index].image != "" &&
                                              _questions[index].ltype != "" &&
                                              _questions[index].ltype == "V"
                                          ? Center(
                                              child: Container(
                                                width: 350,
                                                height: 250,
                                                alignment: Alignment.center,
                                                child: VideoPlayerScreen(
                                                    Videourl: _questions[index]
                                                        .image),
                                              ),
                                            )
                                          : Container(),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      _questions[index].image != "" &&
                                              _questions[index].ltype != "" &&
                                              _questions[index].ltype == "I"
                                          ? SizedBox(
                                              width: 350,
                                              // height: 180,
                                              child: Image.network(
                                                _questions[index].image,
                                                // width: 200,
                                                // height: 150,

                                                //  fit: BoxFit.fill
                                              ),
                                            )
                                          : Container(),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        _questions[index].question,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(color: kBlackColor),
                                      ),
                                      Optons(
                                        1,
                                        _questions[index].opt1,
                                      ),
                                      Optons(
                                        2,
                                        _questions[index].opt2,
                                      ),
                                      Optons(
                                        3,
                                        _questions[index].opt3,
                                      ),
                                      Optons(
                                        4,
                                        _questions[index].opt4,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                : Center(
                    child: Container(
                      child: const Text("loading...."),
                    ),
                  );
          },
        ),
      ],
    );
  }

  Color getTheRightColor(int index) {
    {
      if (index == _correctAns && qoptionindex != 0) {
        return kGreenColor;
      } else if (index == qoptionindex && index != _correctAns) {
        return kRedColor;
      }
    }
    return kGrayColor;
  }

  IconData getTheRightIcon(int index) {
    return getTheRightColor(index) == kRedColor ? Icons.close : Icons.done;
  }

  void checkAns(int selectedIndex) {
    // because once user press any option then it will run
    _answred = true;

    if (_questions[index].opt1 == _questions[index].ans) {
      _correctAns = 1;
    } else if (_questions[index].opt2 == _questions[index].ans) {
      _correctAns = 2;
    }
    if (_questions[index].opt3 == _questions[index].ans) {
      _correctAns = 3;
    }

    if (_questions[index].opt4 == _questions[index].ans) {
      _correctAns = 4;
    }

    if (selectedIndex == _correctAns) {
      _numcorrect = _numcorrect + 1;
    }

    // It will stop the counter
    _questionController.stopPrograss();
    //_animationController!.stop();
    setState(() {});
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(seconds: 4), () {
      _questionController.ResetPrograss();

      setState(() {
        if (index == _questions.length - 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreScreen(
                        _questions.length.toString(),
                        _numcorrect.toString(),
                        widget.id,
                        _questions[index].backid,
                      )));
        } else {
          index = index + 1;
          _answred = false;
          qoptionindex = 0;
        }
      });

      // Then start it again
      // Once timer is finish go to the next qn
    });
  }

  void changeQueston() {
    setState(() {
      if (index == _questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScoreScreen(
                      _questions.length.toString(),
                      _numcorrect.toString(),
                      widget.id,
                      _questions[index].backid,
                    )));
      } else {
        index = index + 1;
        _answred = false;
        qoptionindex = 0;
      }
    });
  }

  Widget Optons(int optionindex, String option) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          if (!_answred) {
            qoptionindex = optionindex;
            checkAns(optionindex);
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
              color: colortoshow1,
              border: Border.all(color: getTheRightColor(optionindex)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  option,
                  style: const TextStyle(color: kGrayColor, fontSize: 16),
                ),
              ),
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: getTheRightColor(optionindex) == kGrayColor
                      ? Colors.transparent
                      : getTheRightColor(optionindex),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: getTheRightColor(optionindex)),
                ),
                child: getTheRightColor(optionindex) == kGrayColor
                    ? null
                    : Icon(getTheRightIcon(optionindex), size: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key? key, required this.Videourl}) : super(key: key);

  String Videourl;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Duration videoLength;
  late Duration videoPositopn;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.Videourl)
      ..addListener(() {
        setState(() {
          videoPositopn = _controller.value.position;
        });
      });
    _initializeVideoPlayerFuture = _controller.initialize();
    setState(() {
      videoPositopn = _controller.value.duration;
    });

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              FutureBuilder<void>(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                // padding: const EdgeInsets.all(10)
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // pause
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // play
                          _controller.play();
                        }
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  // Text(
                  //     '${convertToMinutesSecounds(_controller.value.position)}/ ${convertToMinutesSecounds(_controller.value.duration)}')
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                        '${convertToMinutesSecounds(videoPositopn)}/ ${convertToMinutesSecounds(_controller.value.duration)}'),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String convertToMinutesSecounds(Duration duration) {
  final minutes = duration.inMinutes;
  final secound = duration.inSeconds;
  return '$minutes:$secound';
}
