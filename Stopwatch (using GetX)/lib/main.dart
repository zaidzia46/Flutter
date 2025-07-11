import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:stopwatch/getx.dart';

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
      title: 'STOPWATCH',
      home: StopWatch(),
    );
  }
}

class StopWatch extends StatelessWidget {
  final controller = Get.put(TimerControl());

  String formatTime(int value) {
    return value.toString().padLeft(2, '0');
  }

  String formatMilliseconds(int value) {
    return value.toString().padLeft(3, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF7F8),
      appBar: AppBar(
        title: Text(
          'STOP WATCH',
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w800,
              color: Color(0xffFCF7F8),
              fontFamily: 'MainFont'),
        ),
        backgroundColor: Color(0xffA31621),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 120,
              child: Obx(
                () => Text(
                  '${formatTime(controller.hours.value)}:${formatTime(controller.minutes.value)}:${formatTime(controller.seconds.value)}:${formatMilliseconds(controller.milliseconds.value)}',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffA31621)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controller.start();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffA31621)),
                maximumSize: MaterialStateProperty.all<Size>(Size(120, 40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start',
                    style: TextStyle(
                        color: Color(0xffFCF7F8),
                        fontSize: 15,
                        fontFamily: 'MainFont'),
                  ),
                  Icon(
                    Icons.play_circle,
                    color: Color(0xffFCF7F8),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controller.stop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffA31621)),
                  maximumSize: MaterialStateProperty.all<Size>(Size(120, 40))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stop',
                    style: TextStyle(
                        color: Color(0xffFCF7F8),
                        fontSize: 15,
                        fontFamily: 'MainFont'),
                  ),
                  Icon(
                    Icons.stop,
                    color: Color(0xffFCF7F8),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controller.reset();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffA31621)),
                maximumSize: MaterialStateProperty.all<Size>(Size(120, 40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reset',
                    style: TextStyle(
                        color: Color(0xffFCF7F8),
                        fontSize: 15,
                        fontFamily: 'MainFont'),
                  ),
                  Icon(
                    Icons.restart_alt,
                    color: Color(0xffFCF7F8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
