import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TimerControl extends GetxController {
  Timer? timer;
  RxInt milliseconds = 0.obs;
  RxInt seconds = 0.obs;
  RxInt minutes = 0.obs;
  RxInt hours = 0.obs;
  RxBool isrunning = false.obs;

  void start() {
    if (!isrunning.value) {
      timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        milliseconds.value += 10;
        if (milliseconds.value >= 1000) {
          milliseconds.value = 0;
          seconds++;
        }

        if (seconds >= 60) {
          seconds.value = 0;
          minutes++;
        }

        if (minutes >= 60) {
          minutes.value = 0;
          hours++;
        }
      });
      isrunning.value = true;
    }
  }

  void stop() {
    timer?.cancel();
    isrunning.value = false;
  }

  void reset() {
    stop();
    milliseconds.value = 0;
    seconds.value = 0;
    minutes.value = 0;
    hours.value = 0;
  }
}
