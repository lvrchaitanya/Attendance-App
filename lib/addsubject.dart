
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'subjectcard.dart';

class AddSubject extends StatelessWidget {
  Function onPress;
  AddSubject({this.onPress});
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Color(0xFFFF671B),

        borderRadius: BorderRadius.circular(50),
      ),
      width: 200,
      child: FlatButton(

        child: Text('Add Subject',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),),
        onPressed: onPress,
      ),
    );
  }
}
