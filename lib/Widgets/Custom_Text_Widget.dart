
import 'package:flutter/material.dart';

class TextClass extends StatefulWidget {
  String title;
  FontWeight fontWeight;
  double size;
  Color fontColor;
  TextAlign? align;
  String fontFamily;
  var overflow;
  TextClass(
      {required this.size,
      required this.fontWeight,
      required this.title,
      required this.fontColor,
      required this.fontFamily,
      this.align,
      this.overflow});

  @override
  State<TextClass> createState() => _TextClassState();
}

class _TextClassState extends State<TextClass> {
  @override
  Widget build(BuildContext context) {
    return Text(
      // maxLines: 1,
      widget.title,
      style: TextStyle(
          overflow: widget.overflow,
          fontWeight: widget.fontWeight,
          fontSize: widget.size,
          fontFamily: widget.fontFamily,
          color: widget.fontColor),
      softWrap: true,
      textAlign: widget.align,
    );
  }
}
