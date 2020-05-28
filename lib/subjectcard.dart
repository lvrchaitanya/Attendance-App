import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'subjectcard.dart';


class SubjectCard extends StatelessWidget {
  const SubjectCard({this.boxes,
  }) ;

  final List<Widget> boxes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(

        controller: ScrollController(
          keepScrollOffset: true,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: boxes.length,
        itemBuilder: (context, int index) {
          return boxes[index];
        },
      ),
    );
  }
}

