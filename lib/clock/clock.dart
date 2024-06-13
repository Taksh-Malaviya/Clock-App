
import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../screen/view/digital/digital.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        // home:  Digital_clock(),
        routes: Routes.myRoutes,
    );
  }
}
