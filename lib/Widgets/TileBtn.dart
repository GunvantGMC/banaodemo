// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banaodemo/Models/TileBtnModel.dart';
import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:flutter/material.dart';

class TileBtn extends StatelessWidget {
  final TileBtnModel tileBtn;

  const TileBtn({super.key, required this.tileBtn});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(color: CstmTheme.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8.0)),
      child: ClipRRect(
        child: Material(
          color: CstmTheme.transparentColor,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              showCstmSnackBar(
                context: context,
                msg: "Under Development",
              );
            },
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(AssetImage(tileBtn.img),
                      color: CstmTheme.primaryColor),
                  SizedBox(width: 12.0),
                  Text(
                    tileBtn.title,
                    style: cstmTxtStyle(fs: 14, fw: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
