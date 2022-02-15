// To parse this JSON data, do
//
//     final questinModel = questinModelFromJson(jsonString);

import 'dart:convert';

List<QuestinModel> questinModelFromJson(String str) => List<QuestinModel>.from(
    json.decode(str).map((x) => QuestinModel.fromJson(x)));

String questinModelToJson(List<QuestinModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestinModel {
  QuestinModel({
    required this.qno,
    required this.question,
    required this.opt1,
    required this.opt2,
    required this.opt3,
    required this.opt4,
    required this.image,
    required this.ltype,
    required this.ans,
    required this.qtype,
    required this.backid,
  });

  int qno;
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String image;
  dynamic ltype;
  String ans;
  String qtype;
  String backid;

  factory QuestinModel.fromJson(Map<String, dynamic> json) => QuestinModel(
        qno: json["Qno"],
        question: json["Question"],
        opt1: json["Opt1"],
        opt2: json["Opt2"],
        opt3: json["Opt3"],
        opt4: json["Opt4"],
        image: json["image"],
        ltype: json["Ltype"],
        ans: json["Ans"],
        qtype: json["Qtype"],
        backid: json["Backid"],
      );

  Map<String, dynamic> toJson() => {
        "Qno": qno,
        "Question": question,
        "Opt1": opt1,
        "Opt2": opt2,
        "Opt3": opt3,
        "Opt4": opt4,
        "Image": image,
        "Ltype": ltype,
        "Ans": ans,
        "Qtype": qtype,
        "Backid": backid,
      };
}
