library mfk_accordion;

import 'package:flutter/material.dart';

import 'model/my-accordion-model.dart';

// ignore: must_be_immutable
class MyAccordion extends StatefulWidget {
  List<MyAccordionModel> list;
  TextStyle titleTextStyle;
  BoxDecoration titleDecoration;
  TextStyle contentTextStyle;
  BoxDecoration contentDecoration;
  IconData expandenIcon;
  IconData collapsedIcon;
  EdgeInsets margin;

  MyAccordion(
    this.list, {
    Key key,
    this.titleTextStyle,
    this.contentTextStyle,
    this.titleDecoration,
    this.contentDecoration,
    this.margin,
    this.expandenIcon,
    this.collapsedIcon,
  }) : super(key: key);

  @override
  _MyAccordionState createState() => _MyAccordionState();
}

class _MyAccordionState extends State<MyAccordion> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list?.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                height: 42,
                margin: widget.margin ??
                    EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                      right: 10,
                    ),
                decoration: widget.titleDecoration ??
                    BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xffebebeb),
                      ),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        widget.list[index].title,
                        style: widget.contentTextStyle,
                      ),
                    ),
                    Container(
                      child: Icon(
                        widget.list[index].isExpanded
                            ? widget.expandenIcon ?? Icons.arrow_drop_up
                            : widget.collapsedIcon ?? Icons.arrow_drop_down,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.list[index].isExpanded,
              child: Container(
                decoration: widget.contentDecoration,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.list[index]?.content,
                  style: widget.contentTextStyle,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void onTap(int index) {
    setState(() {
      for (var i = 0; i < widget.list.length; i++) {
        if (index != i) {
          widget.list[i].isExpanded = false;
        }
      }

      widget.list[index].isExpanded = !widget.list[index].isExpanded;
    });
  }
}
