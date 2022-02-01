import 'package:flutter/cupertino.dart';

class Question {
  final int id, answer;
  final String question;
  dynamic image;
  dynamic video;

  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.image,
      this.video,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        '''कु रुक्षेत्र ल कसभा - 02 क्षेत्र के अधीन आने वाले जवधान सभा क्षेत्र ................''',
    "image": "assets/bhagvt.jpg",
    "video": "https://www.youtube.com/watch?v=qkkO4Fzkd-Q",
    "options": [
      'कलायत, शाहािाद, कै थल, नील खेडी, लाडवा, पूांडरी, रादौर, पेह वा, थानेसर',
      'थानेसर, लाडवा, रादौर, करनाल , पेह वा, शाहािाद, कै थल, कलायत, पूांडरी',
      'लाडवा, कलायत, यमुनानगर , पूांडरी, रादौर, पेह वा, शाहािाद, कै थल, थानेसर',
      'थानेसर, लाडवा, कलायत, पूांडरी, रादौर, पेह वा, शाहािाद, कै थल, गुहला'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "image": "assets/img1.jpg",
    "video": "https://www.youtube.com/watch?v=qkkO4Fzkd-Q",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "image": "assets/bhagvt.jpg",
    "video": "https://www.youtube.com/watch?v=qkkO4Fzkd-Q",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "image": "assets/img2.jpg",
    "video": "https://www.youtube.com/watch?v=qkkO4Fzkd-Q",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];
