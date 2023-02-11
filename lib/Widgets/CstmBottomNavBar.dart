// ignore_for_file: prefer_const_constructors

import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CstmBottomNavBar extends StatelessWidget {
  const CstmBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: CstmTheme.whiteColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: getNavIconAndName(
              name: "Home",
              img: "assets/images/home.png",
              isActive: true,
            ),
          ),
          Expanded(
            child: getNavIconAndName(
              name: "Learn",
              img: "assets/images/book_open.png",
            ),
          ),
          Expanded(
            child: getNavIconAndName(
              name: "Hub",
              img: "assets/images/interface.png",
            ),
          ),
          Expanded(
            child: getNavIconAndName(
              name: "Chat",
              img: "assets/images/comment.png",
            ),
          ),
          Expanded(
            child: getNavIconAndName(
              name: "Profile",
              img: "assets/images/profile.png",
            ),
          ),
        ],
      ),
    );
  }

  getNavIconAndName({required name, required img, isActive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (isActive)
          Divider(
            color: CstmTheme.primaryColor,
            height: 2,
            thickness: 3,
          ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "$img",
                // color:
                //     isActive ? CstmTheme.primaryColor : CstmTheme.ternaryColor,
              ),
              // ImageIcon(
              //   AssetImage("$img"),
              //   color:
              //       isActive ? CstmTheme.primaryColor : CstmTheme.ternaryColor,
              // ),
              Text(
                "$name",
                style: cstmTxtStyle(
                  fs: 12.0,
                  fc: isActive
                      ? CstmTheme.primaryColor
                      : CstmTheme.secondaryColor,
                  fw: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
