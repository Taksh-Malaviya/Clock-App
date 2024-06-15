import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();

}

class _StrapWatchState extends State<StrapWatch> {
  int h =0;
  int m =0;
  int s =0;
  List day = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  List month = [
    "Jan",
    "Fab",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Des"
  ];

  DateTime dateTime =DateTime.now();

  @override

  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    double hh = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      h = dateTime.hour;
      m = dateTime.minute;
      s = dateTime.second;
      setState(() {});
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Strap Watch"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Align(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(dateTime.hour % 12).toString().padLeft(2, "0")}:${(dateTime.minute).toString().padLeft(2, "0")}",
                        style: TextStyle(
                          fontSize: textScaler.scale(35),
                        ),
                      ),
                      (dateTime == DayPeriod)
                          ? const Text("  AM")
                          : const Text("  PM"),
                    ],
                  ),
                ],
              ),

              Transform.scale(
                scale: 8.5,
                child: CircularProgressIndicator(
                  color: Colors.pinkAccent[100],
                  strokeWidth: 0.8,
                  value: s/60,
                ),
              ),
              Transform.scale(
                scale: 7.2,
                child:  CircularProgressIndicator(
                  color: Colors.pinkAccent[100],
                  strokeWidth: 1.1,
                  value: m/60,
                ),
              ),
              Transform.scale(
                scale: 6.2,
                child: CircularProgressIndicator(
                  color: Colors.pinkAccent[100],
                  strokeWidth: 1.5,
                  value: (h%12+(m/60))/12,
                ),
               ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text(
                  "${day[dateTime.weekday - 1]} , ${dateTime.day} ${month[dateTime.month - 1]} ${dateTime.year}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: textScaler.scale(16)),
                ),
                  SizedBox(height: hh * 0.15,),
              ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
