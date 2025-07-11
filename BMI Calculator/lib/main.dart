import 'dart:math';

import 'package:bmi/spalshscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: SplashScreen(),
    );
  }
}

class BMI extends StatefulWidget {
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var weight = TextEditingController();
  var height = TextEditingController();
  var bmi;
  var roundedBmi;
  var wt;
  var ht;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'newfont'),
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: SizedBox(
            width: 330,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  child: Text(
                    'Welcome to BMI Calculator',
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monfont'),
                  ),
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.pink,
                    style: TextStyle(color: Colors.pink),
                    controller: weight,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.line_weight,
                          color: Colors.pink,
                        ),
                        label: Text(
                          'Enter your weight (in KG)',
                          style: TextStyle(
                              color: Colors.pink,
                              fontFamily: 'monfont',
                              fontWeight: FontWeight.bold),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2)))),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.pink,
                    style: TextStyle(color: Colors.pink),
                    controller: height,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.height,
                          color: Colors.pink,
                        ),
                        label: Text(
                          'Enter your height (in feet)',
                          style: TextStyle(
                              color: Colors.pink,
                              fontFamily: 'monfont',
                              fontWeight: FontWeight.bold),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2)))),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    wt = weight.text.toString();
                    ht = height.text.toString();

                    if (wt != "" && ht != "") {
                      setState(() {
                        var ht_in_meter = double.parse(ht) * 0.3048;
                        var wt_in_kg = double.parse(wt);
                        bmi = wt_in_kg / (ht_in_meter * ht_in_meter);
                        roundedBmi = double.parse(bmi.toStringAsFixed(2));
                      });
                    } else {
                      setState(() {
                        roundedBmi = 'Please enter the data correctly!';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        fontFamily: 'monfont'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: roundedBmi != null
                            ? Text(
                                'BMI: $roundedBmi',
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'monfont'),
                              )
                            : null),
                    SizedBox(
                      width: 2,
                    ),
                    if (roundedBmi != null &&
                        roundedBmi != 'Please enter the data correctly!')
                      if (roundedBmi! < 18.5)
                        Text(
                          '(Underweight)',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monfont'),
                        )
                      else if (roundedBmi! < 24.9)
                        Text(
                          '(Normal)',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monfont'),
                        )
                      else if (roundedBmi! < 29.9)
                        Text(
                          '(Overweight)',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monfont'),
                        )
                      else
                        Text(
                          '(Obese)',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monfont'),
                        )
                    else
                      Text(''),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
