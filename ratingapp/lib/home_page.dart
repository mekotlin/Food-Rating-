import 'dart:io';

import 'package:awesome_slider/awesome_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double newVal = 5.0;
  double minVal = 1.0;
  double maxval = 10.0;
  String smileyText = 'Hmm Satisfied 😇';
  AssetImage _imagePath = AssetImage('images/smile.png');

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => exit(0),
                  child: Icon(
                    Icons.close,
                    size: 32,
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: 'How was\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'your',
                      ),
                      TextSpan(
                          text: ' Food?',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.03,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20.0),
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    color: Colors.white),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    smileyText,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              child: Image(
                image: _imagePath,
                height: mediaQuery.size.height * .30,
                width: mediaQuery.size.height * .30,
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.03,
            ),
            Container(
              child: AwesomeSlider(
                value: newVal.toDouble(),
                min: minVal,
                max: maxval,
                thumbSize: 50,
                thumbColor: Colors.transparent,
                roundedRectangleThumbRadius: 10.0,
                activeLineStroke: 4.0,
                activeLineColor: Colors.white,
                inactiveLineColor: Colors.white54,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 5,
                    ),
                  ),
                ),
                onChanged: (double newValue) {
                  setState(() {
                    var val = newValue.round();

                    if (val <= 5) {
                      smileyText = 'Ugh! Bad 😡';
                      _imagePath = AssetImage('images/bad.png');
                    } else if (val > 6 && 8 >= val) {
                      smileyText = 'Hmm Satisfied 😇';
                      _imagePath = AssetImage('images/smile.png');
                    } else {
                      smileyText = 'Loved It! 😍👍🏼';
                      _imagePath = AssetImage('images/love.png');
                    }

                    newVal = newValue;
                  });
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              width: double.infinity,
              child: RawMaterialButton(
                elevation: 6.0,
                onPressed: () {
                  print('Done 👍🏼');
                },
                constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fillColor: Colors.black,
                child: Text(
                  'Done 👍🏼',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
