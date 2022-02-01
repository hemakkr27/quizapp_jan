// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:testing/controllers/question_controller.dart';
// // import 'package:quiz_app/constants.dart';
// // import 'package:quiz_app/controllers/question_controller.dart';

// import '../../constants.dart';
// import 'components/progress_bar.dart';
// import 'components/question_card.dart';

// class QuizScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     QuestionController _controller = Get.put(QuestionController());
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         // Fluttter show the back button automatically
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
//         ],
//       ),
//       body: Body(),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // So that we have acccess our controller
//     QuestionController _questionController = Get.put(QuestionController());
//     return Stack(
//       children: [
//         Image.asset(
//           "assets/bgimg.JPG",
//           fit: BoxFit.fill,
//           width: double.infinity,
//           height: double.infinity,
//         ),
//         SafeArea(
//           child: QuestionCard(),
//         )
//       ],
//     );
//   }
// }
