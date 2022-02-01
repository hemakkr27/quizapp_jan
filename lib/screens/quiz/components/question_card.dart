// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:testing/controllers/question_controller.dart';
// import 'package:testing/model/QuestionModel.dart';
// import 'package:testing/model/Questions.dart';
// import 'package:http/http.dart' as http;
// import 'package:testing/screens/quiz/components/progress_bar.dart';

// // import 'package:quiz_app/controllers/question_controller.dart';
// // import 'package:quiz_app/models/Questions.dart';

// import '../../../constants.dart';
// import 'option.dart';

// class QuestionCard extends StatefulWidget {
//   @override
//   State<QuestionCard> createState() => _QuestionCardState();
// }

// class _QuestionCardState extends State<QuestionCard> {
//   QuestionController _questionController = Get.put(QuestionController());
//   int index = 0;

//   late List<QuestinModel> _questions;

//   Future<List<QuestinModel>> getdata() async {
//     var response = await http.get(Uri.parse(
//         'https://script.google.com/macros/s/AKfycbz_EM1r3Nh_XuzJigymZfhu0lyOIRDbxEfFM1tDI9bpHrgQ3ogz_x9KTRy300Uq95tekg/exec'));

//     if (response.statusCode == 200) {
//       // If the call to the server was successful (returns OK), parse the JSON.
//       // QuestinModel.fromJson(json.decode(response.body)).toList();
//       final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

//       _questions = parsed
//           .map<QuestinModel>((json) => QuestinModel.fromJson(json))
//           .toList();
//       return _questions;
//     } else {
//       // If that call was not successful (response was unexpected), it throw an error.
//       throw Exception('Failed to load post');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getdata(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         return snapshot.hasData
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                     child: ProgressBar(),
//                   ),
//                   const SizedBox(height: kDefaultPadding),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                     child: Text.rich(
//                       TextSpan(
//                         text: "Question ${1}",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline4
//                             ?.copyWith(color: kSecondaryColor),
//                         children: [
//                           TextSpan(
//                             text: "/${1}",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline5
//                                 ?.copyWith(color: kSecondaryColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Divider(thickness: 1.5),
//                   SizedBox(height: kDefaultPadding),
//                   Expanded(
//                       child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                     padding: EdgeInsets.all(kDefaultPadding),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Text(
//                             _questions[index].question,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline6
//                                 ?.copyWith(color: kBlackColor),
//                           ),
//                           SizedBox(height: kDefaultPadding / 2),
//                           // Image.network(
//                           //   image,
//                           //   fit: BoxFit.fill,
//                           // ),
//                           // Image.asset(
//                           //   image,
//                           //   fit: BoxFit.fill,
//                           // ),

//                           Option(
//                               text: _questions[index].opt1,
//                               index: 1,
//                               press: () {
//                                 _questionController.checkAns(
//                                     _questions[index].opt1,
//                                     1,
//                                     index,
//                                     _questions[index].ans,
//                                     _questions.length);
//                                 index++;
//                               }),
//                           Option(
//                               text: _questions[index].opt2,
//                               index: 2,
//                               press: () {
//                                 setState(() {
//                                   _questionController.checkAns(
//                                       _questions[index].opt2,
//                                       2,
//                                       index,
//                                       _questions[index].ans,
//                                       _questions.length);
//                                   index++;
//                                 });
//                               }),
//                           Option(
//                               text: _questions[index].opt3,
//                               index: 3,
//                               press: () {
//                                 setState(() {
//                                   _questionController.checkAns(
//                                       _questions[index].opt3,
//                                       3,
//                                       index,
//                                       _questions[index].ans,
//                                       _questions.length);
//                                   index++;
//                                 });
//                               }),
//                           Option(
//                               text: _questions[index].opt4,
//                               index: 4,
//                               press: () {
//                                 setState(() {
//                                   _questionController.checkAns(
//                                       _questions[index].opt4,
//                                       4,
//                                       index,
//                                       _questions[index].ans,
//                                       _questions.length);
//                                   index++;
//                                 });
//                               }),
//                         ],
//                       ),
//                     ),
//                   )

//                       //PageView.builder(
//                       //   // Block swipe to next qn
//                       //   physics: NeverScrollableScrollPhysics(),
//                       //   controller: _questionController.pageController,
//                       //   onPageChanged: _questionController.updateTheQnNum,
//                       //   itemCount: _questionController.questions.length,
//                       //   itemBuilder: (context, index) => QuestionCard(
//                       //     question: _questionController.questions[index],
//                       //     image: _questionController.questions[index].image,
//                       ),
//                 ],
//               )
//             : Center(
//                 child: Text("Please wait loading......."),
//               );
//       },
//     );
//   }
// }
