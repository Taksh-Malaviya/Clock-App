
import 'package:clock_app/screen/strap/strap.dart';
import 'package:clock_app/screen/view/digital/digital.dart';
import 'package:clock_app/screen/view/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';


class Routes {
  static String digitalClock = '/';
  static String stopwatch = 'stopwatch';
  static String strapwatch = 'strapwatch';

  static Map<String, WidgetBuilder> myRoutes = {
    digitalClock : (context) => const DigitalClock(),
    stopwatch: (context) => const StopWatch(),
    strapwatch: (context) => const StrapWatch(),
  };
}