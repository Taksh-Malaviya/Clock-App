import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();

}

class _StrapWatchState extends State<StrapWatch> {
  TimeOfDay time = TimeOfDay.now();

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (time.minute != TimeOfDay.now().minute) {
          setState(() {
            time = TimeOfDay.now();
          });
        }
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strap Watch"),
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 5,
              child: const CircularProgressIndicator(
                color: Colors.yellow,
                strokeWidth: 4,
              ),
            ),
            Transform.rotate(
              angle: pi/2,
              child: Transform.rotate(
                angle: (time.hour % 12 + (time.minute / 60)) * (pi * 2) / 12,
                child: Transform.scale(
                  scale: 3,
                  child: const CircularProgressIndicator(
                    color: Colors.pinkAccent,
                    strokeWidth: 4,
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 4,
              ),
             ),
          ],
        ),
      ),
    );
  }
}
