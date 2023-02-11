import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

cstmTxtStyle({fs, fw, fc, ff = "Inter"}) {
  return GoogleFonts.getFont(
    "$ff",
    fontSize: fs != null ? fs.toDouble() : 16.0,
    fontWeight: fw ?? FontWeight.normal,
    color: fc ?? CstmTheme.primaryColor,
  );
}

showCstmSnackBar({required context, required msg, durInSec = 4}) {
  SnackBar snackBar = SnackBar(
    content: Text('$msg'),
    duration: Duration(seconds: durInSec),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
