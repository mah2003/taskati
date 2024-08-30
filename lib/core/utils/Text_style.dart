import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getHeadLineTextStyle(
    {double fontsize = 24,
    FontWeight = FontWeight.bold,
    color = Appcolor.black}) {
  return TextStyle(
      fontFamily: 'pappins',
      fontSize: fontsize,
      fontWeight: FontWeight,
      color: color);
}

TextStyle getBodyTextStyle(
    {double fontsize = 17,
    FontWeight = FontWeight.normal,
    color = Appcolor.black}) {
  return TextStyle(
      fontFamily: 'pappins',
      fontSize: fontsize,
      fontWeight: FontWeight,
      color: color);
}

TextStyle getSmallTextStyle(
    {double fontsize = 15,
    FontWeight = FontWeight.normal,
    color = Appcolor.gray}) {
  return TextStyle(
      fontFamily: 'pappins',
      fontSize: fontsize,
      fontWeight: FontWeight,
      color: color);
}
