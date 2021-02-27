import 'package:flutter/material.dart';

class MyAccordionModel {
  @required
  String title;
  @required
  String content;
  @required
  bool isExpanded;

  MyAccordionModel(
    this.title,
    this.content,
    this.isExpanded,
  );
}
