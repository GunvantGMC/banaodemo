// ignore_for_file: prefer_const_constructors

import 'package:flutter/animation.dart';

class ProgramModel {
  String id;
  DateTime createdAt;
  String name;
  String category;
  String img;
  Color color;
  int lesson;

  ProgramModel({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.img,
    required this.color,
    required this.lesson,
  });

  factory ProgramModel.fromJson({
    required int pos,
    required Map<String, dynamic> jsonData,
  }) {
    print("JSON IN FROM JSON : $jsonData ${pos.runtimeType}");
    return ProgramModel(
      id: jsonData["id"],
      name: jsonData["name"],
      category: jsonData["category"],
      createdAt: DateTime.parse(jsonData["createdAt"]),
      img: pos % 2 == 0 ? "assets/images/pfu1.png" : "assets/images/pfu2.png",
      color: pos % 2 == 0 ? Color(0xFFDDE3C2) : Color(0xFFFFF0D3),
      lesson: jsonData["lesson"],
    );
  }
}
