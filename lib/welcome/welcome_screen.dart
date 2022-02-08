import 'package:flutter/material.dart';
import 'package:testing/screens/quiz/quiz_screen.dart';

import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  String id;
  WelcomeScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/bgimg.JPG",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  const Spacer(),
                  const SizedBox(
                    height: 30,
                  ),
                  Flexible(
                    child: ListView(
                      children: [
                        Center(child: Image.asset("assets/im.png")),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Image.asset("assets/images_2.png")),
                        // const Spacer(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Let's Play Quiz,",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Text("Enter your informations below"),
                        // const Spacer(), // 1/6
                        const SizedBox(
                          height: 30,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF1C2341),
                            hintText: "Full Name",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                        // const Spacer(), // 1/6
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizScreen(id)));
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                kDefaultPadding * 0.75), // 15
                            decoration: const BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                        //  const Spacer(flex: 2),
                      ],
                    ),
                  ), //2/6
                  // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
