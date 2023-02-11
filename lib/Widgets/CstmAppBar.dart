// ignore_for_file: prefer_const_constructors

import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:flutter/material.dart';

class CstmAppBar extends StatelessWidget {
  const CstmAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CstmTheme.accentColor,
      elevation: 0.0,
      actions: [
        SizedBox(width: 20.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: const [
              ImageIcon(
                AssetImage("assets/images/menu.png"),
                color: CstmTheme.secondaryColor,
              ),
            ],
          ),
        ),
        ImageIcon(
          AssetImage("assets/images/message.png"),
          color: CstmTheme.secondaryColor,
        ),
        SizedBox(width: 20.0),
        ImageIcon(
          AssetImage("assets/images/notification.png"),
          color: CstmTheme.secondaryColor,
        ),
        SizedBox(width: 20.0),
      ],
    );
  }
}
