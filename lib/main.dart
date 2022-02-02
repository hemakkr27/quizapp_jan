import 'package:flutter/material.dart';
import 'package:testing/welcome/welcome_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  String myurl = Uri.base.toString(); //get complete url
  String? para1 =
      Uri.base.queryParameters["id"]; //get parameter with attribute "para1"
  runApp(MyApp(para1.toString()));
}

class MyApp extends StatelessWidget {
  String id;
  MyApp(this.id);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(id = id),
    );
  }
}
