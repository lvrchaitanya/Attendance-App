import 'dart:ui';

import 'package:attendance/addsubject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'subjectcard.dart';
import 'thecard.dart';

class AddNewSubject extends StatefulWidget {
  @override
  _AddNewSubjectState createState() => _AddNewSubjectState();
}

class _AddNewSubjectState extends State<AddNewSubject> {
   String mytext='Add New Subject';
  @override
  Widget build(BuildContext context) {
    String subject;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              mytext,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Color(0xFF456FC1),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                subject = newText;
              },
            ),
            SizedBox(height: 30,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),

              child: FlatButton(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'add subject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                color: Color(0xFF456FC1),
                onPressed: () {
                  if( subject == null )
                    {
                      setState(() {
                        mytext="Enter subject";
                      });
                    }
                  else
                  Navigator.pop(context,subject);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

