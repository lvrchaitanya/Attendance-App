import 'dart:ui';

import 'package:attendance/addnewsubject.dart';
import 'package:attendance/addsubject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'subjectcard.dart';
import 'thecard.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> boxes = [];
  int count=0;

  void initState() {

    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Column(

        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(

//              child: Center(
//                child: Text('YOUR ATTENDANCE',
//                  style: TextStyle(
//                      fontSize: 48.0,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              decoration: BoxDecoration(
//                color: Colors.blueAccent,
//                gradient: LinearGradient(
//                    begin: Alignment.topRight,
//                    end: Alignment.bottomLeft,
//                    stops: [ 0,0.9],
//                    colors: [Colors.blueAccent,Colors.redAccent]),
//              ),

                decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/attimg1.jpeg"),
                      fit: BoxFit.fill,
                    )
                )



            ),
          ),
          SizedBox( height: 8,),

          Expanded(
            flex:11,
            child: boxes.length != 0 ? SubjectCard( boxes : boxes,)
             : Padding(
               padding: const EdgeInsets.all(40.0),
               child: Container(

                child: Center(
                  child: Text('ADD SUBJECTS',
                    style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [ 0,0.9],
                      colors: [Colors.blueAccent,Colors.redAccent]),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 350,

                width: double.infinity,


            ),
             ),
          ),
          SizedBox( height: 8,),
          Expanded(
              flex: 1,
            child: AddSubject(
                onPress: () async {
                  final subject = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                          child:Container(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: AddNewSubject(),
                          )
                      )
                  );
                  setState(() {
                    if(subject != null) {
                      boxes.add(
                        TheCard(sub: subject, boxes: boxes,count : count++,),
                      );
                    }
                  });
                }
              )
          ),
          SizedBox(height: 30,),
        ],
      )
    );
  }
}
