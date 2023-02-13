// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banaodemo/Models/LessonModel.dart';
import 'package:banaodemo/Models/ProgramModel.dart';
import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LessonsTileCard extends StatelessWidget {
  final LessonModel lessonModel;
  const LessonsTileCard({super.key, required this.lessonModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(5.0),
      width: width * 0.6,
      decoration: BoxDecoration(
          color: CstmTheme.whiteColor,
          border: Border.all(color: CstmTheme.dynColor(0xFFEBEDF0)),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: CstmTheme.dynColor(0x140E443E),
              blurRadius: 12.0,
              spreadRadius: 0.0,
              offset: Offset(0, 0),
            ),
          ]),
      child: ClipRRect(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width * 0.7,
                height: height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(lessonModel.img), fit: BoxFit.fill),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: CstmTheme.whiteColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      lessonModel.category.toUpperCase(),
                      style: cstmTxtStyle(
                        fs: 12,
                        fw: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      lessonModel.name,
                      style: cstmTxtStyle(
                        fs: 16,
                        fc: CstmTheme.blackColor,
                        fw: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${lessonModel.duration} min",
                          style: cstmTxtStyle(
                            fs: 12,
                            fw: FontWeight.w500,
                            fc: CstmTheme.ternaryColor,
                          ),
                        ),
                        Icon(
                          lessonModel.isLocked ? Icons.lock : Icons.lock_open,
                          color: CstmTheme.ternaryColor,
                        )
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
