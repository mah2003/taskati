import 'package:flutter/material.dart';
import 'package:taskati/core/utils/Text_style.dart';
import 'package:taskati/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width = 250,
    this.height = 50,
    required this.text,
    required this.onTap,
    required this.textstyle,
    this.raduis = 10,
    this.color = Appcolor.blue,
  });
  final double width;
  final double height;
  final String text;
  final Function() onTap;
  final TextStyle? textstyle;
  final double raduis;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(raduis)),
              foregroundColor: Appcolor.white),
          onPressed: onTap,
          child: Text(
            text,
            style: textstyle ??
                getBodyTextStyle(
                  color: Appcolor.white,
                ),
          ),
        ));
  }
}
