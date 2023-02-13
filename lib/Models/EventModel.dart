// ignore_for_file: prefer_const_constructors

import 'package:flutter/animation.dart';

class EventModel {
  String id;
  DateTime createdAt;
  String name;
  String category;
  String img;
  Color color;

  EventModel({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.img,
    required this.color,
  });

  String getimplifiedDate() {
    List<String> monthList = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    return "${createdAt.day} ${monthList[createdAt.month]}, ${createdAt.year}";
  }
}
