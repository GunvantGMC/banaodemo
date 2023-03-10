// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banaodemo/Models/ProgramModel.dart';
import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:flutter/widgets.dart';

class ProgramsTileCard extends StatelessWidget {
  final ProgramModel tileCardModel;
  const ProgramsTileCard({super.key, required this.tileCardModel});

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
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: CstmTheme.dynColor(0x140E443E),
              blurRadius: 12.0,
              spreadRadius: 0.0,
              offset: Offset(0, 0),
            ),
          ]),
      child: ClipRRect(
        child: Column(
          children: [
            Container(
              width: width * 0.7,
              height: height * 0.2,
              decoration: BoxDecoration(
                color: tileCardModel.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                image: DecorationImage(
                  image: AssetImage(tileCardModel.img),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: CstmTheme.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    tileCardModel.category.toUpperCase(),
                    style: cstmTxtStyle(
                      fs: 12,
                      fw: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    tileCardModel.name,
                    style: cstmTxtStyle(
                      fs: 16,
                      fc: CstmTheme.blackColor,
                      fw: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "${tileCardModel.lesson} lessons",
                    style: cstmTxtStyle(
                      fs: 12,
                      fw: FontWeight.w500,
                      fc: CstmTheme.ternaryColor,
                    ),
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
