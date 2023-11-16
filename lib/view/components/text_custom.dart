import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.data,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight, // 400, 700
        fontSize: fontSize, // 15 for paragraghrs
        fontFamily: "Outfit",
      ),
    );
  }
}
