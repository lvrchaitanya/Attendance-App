import 'dart:ui';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:attendance/addsubject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'subjectcard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TheCard extends StatefulWidget {
 int count;
  TheCard({this.sub,this.boxes,this.count});
  String sub;
 List<Widget> boxes;
  @override
  _TheCardState createState() => _TheCardState(sub: sub, boxes:boxes,count: count);
}

class _TheCardState extends State<TheCard> {
  String sub; int count;
  List<Widget> boxes;
  _TheCardState({this.sub,this.boxes,this.count});

  var subject;

List<String> lowatt;

  int present=0,absent=0,pre=0;
  var percent,presente;
  double attper(int present,int absent){
    if(  absent == 0) {
      percent=100;
      return 1.0;
    }
    else
     { percent=((present/(present+absent))*100).toStringAsFixed(1);
     pre=((present/(present+absent))*100).toInt();

       return (present/(present+absent));}
  }

    String check(String sub){
    if( sub == null )
      return sub;
    else
      return sub.toUpperCase();
   }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.all(30),
        width: 280,
        height: 350,
//          decoration: BoxDecoration(
//            color: pre < 74.9999 ?Color(0xEDFFA927): Color(0xFD4446AD),
//
//            borderRadius: BorderRadius.circular(20),
//          ),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [ 0,0.9],
              colors: [Colors.blueAccent,Colors.redAccent]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Text(check(sub),
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,),

            CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 18.0,
              animation: true,
              percent: attper(present, absent),
              center: new Text(
                "$percent%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
              ),
              footer: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: new Text(
                  "$present Present, $absent Absent ",
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0,color: Colors.white),
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor:  pre < 74.9999 ?Color(0xCAFFA927): Color(0xEE4446AD),
              backgroundColor: Colors.white,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  percent: pre,
                  onPress: (){
                    setState(() {
                      present++;
                      print(present);
                    });

                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RoundIconButton(
                  percent: pre,
                  icon: FontAwesomeIcons.minus,
                  onPress: (){
                    setState(() {
                      absent++;
                    });



                  },
                ),
              ],
            ),


          ],
        )
    );
  }
}



class RoundIconButton extends StatelessWidget {
  IconData icon;
  Function onPress;
  var percent;
  RoundIconButton({this.icon,this.onPress,this.percent});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      child: Icon(icon,
          color: percent < 75 ?Color(0xFD4446AD): Color(0xEDFFA927),),
      fillColor: Colors.white,
      shape: CircleBorder(),
      onPressed:onPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
