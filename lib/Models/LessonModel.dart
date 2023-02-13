// ignore_for_file: prefer_const_constructors

import 'package:banaodemo/Services/Functions.dart';
import 'package:flutter/animation.dart';

class LessonModel {
  String id;
  DateTime createdAt;
  String name;
  int duration;
  String category;
  bool isLocked;
  String img;
  Color color;

// "createdAt": "2022-11-05T05:23:46.786Z",
//             "name": "Voluptatem aut aut eaque qui.",
//             "duration": 23,
//             "category": "Books",
//             "locked": false,
//             "id": "1"

  LessonModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.isLocked,
    required this.img,
    required this.color,
  });

  factory LessonModel.fromJson({
    required int pos,
    required Map<String, dynamic> jsonData,
  }) {
    print("JSON IN FROM JSON : $jsonData ${pos.runtimeType}");
    return LessonModel(
      id: jsonData["id"],
      name: jsonData["name"],
      category: jsonData["category"],
      createdAt: DateTime.parse(jsonData["createdAt"]),
      img: "assets/images/ene1.png",
      color: Color(0xFFFFF0D3),
      duration: jsonData["duration"],
      isLocked: stringToBool(str: jsonData["locked"]),
    );
  }
}
