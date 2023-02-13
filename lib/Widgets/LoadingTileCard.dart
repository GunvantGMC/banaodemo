// ignore_for_file: prefer_const_constructors

import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingTileCard extends StatelessWidget {
  final message;
  const LoadingTileCard({super.key, this.message = "Loading Data..."});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(
              color: CstmTheme.secondaryColor,
            ),
            Text(
              "$message",
              style: cstmTxtStyle(
                fs: 18.0,
                fc: CstmTheme.primaryColor,
                fw: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text("Please Wait..."),
          ],
        ),
      ),
    );
  }
}
