import 'dart:async';
import 'dart:math';

import 'package:clock_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  TimeOfDay time = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  String? dropdown;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      Duration(seconds: 1),
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
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Clock App"),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(
          //     radius: 15,
          //     backgroundColor: Colors.pinkAccent[100],
          //     child: Icon(Icons.add,color: Colors.white,),
          //   ),
          // )
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.stopwatch);
            },
            icon: Icon(
              Icons.watch_later_outlined,
              color: Colors.black,
            ),
            color: Colors.pinkAccent,
            tooltip: "ADD",
          ),
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Taksh"),
              accountEmail: Text("taksh5834@gmail.com"),
            ),
            ListTile(
              leading: Text("01"),
              title: Text("Digital Clock"),
              subtitle: Text("Clock App"),
            ),
            ListTile(
              leading: Text("02"),
              title: Text("Analog Clock"),
              subtitle: Text("Clock App"),
            ),
            ListTile(
              leading: Text("03"),
              title: Text("Strap Watch"),
              subtitle: Text("Clock App"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: w * 0.3,
                    ),
                    Text(
                      "India Time",
                      style: TextStyle(
                        fontSize: textScaler.scale(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("   GMT+")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${(time.hour % 12).toString().padLeft(2, "0")}:${(time.minute).toString().padLeft(2, "0")}",
                      style: TextStyle(
                        fontSize: textScaler.scale(65),
                      ),
                    ),
                    (time == DayPeriod)
                        ? const Text("  AM")
                        : const Text("  PM"),
                  ],
                ),
                Text(
                  "${day[dateTime.weekday - 1]} , ${dateTime.day} ${month[dateTime.month - 1]} ${dateTime.year}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: textScaler.scale(16)),
                ),
                // SizedBox(height:  h * 0.01,),
                Divider(
                  endIndent: w * 0.1,
                  indent: w * 0.1,
                ),
              ],
            ),
            ...List.generate(
              60,
              (index) => Transform.rotate(
                angle: (index * (pi * 2)) / 60,
                child: Divider(
                  color:
                      (index % 5 == 0) ? Colors.pinkAccent[100] : Colors.grey,
                  thickness: 2,
                  endIndent: (index % 5 == 0) ? w * 0.84 : w * 0.875,
                ),
              ),
            ),
            const CircleAvatar(
              radius: 5,
              backgroundColor: Colors.black,
            ),
            //min
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: (time.minute * (pi * 2)) / 60,
                child: Divider(
                  indent: w * 0.18,
                  endIndent: w * 0.43,
                  thickness: 3,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            //hour
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: (time.hour % 12 + (time.minute / 60)) * (pi * 2) / 12,
                child: Divider(
                  indent: w * 0.26,
                  endIndent: w * 0.43,
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
            ),
            // SizedBox(height:  h * 0.1,),
            // Padding(
            //   padding: const EdgeInsets.only(top: 590.0),
            //   child: Column(
            //     children: [
            //       Text("${dropdown}"),
            //     ],
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(width: w * 0.3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //dropdown

                    DropdownButton(
                        value: dropdown,
                        hint: Text("Country"),
                        items: const [
                          DropdownMenuItem(
                            value: "USA",
                            child: Text("USA"),
                          ),
                          DropdownMenuItem(
                            value: "CANADA",
                            child: Text("CANADA"),
                          ),
                          DropdownMenuItem(
                            value: "GERMANY",
                            child: Text("GERMANY"),
                          ),
                          DropdownMenuItem(
                            value: "INDIA",
                            child: Text("INDIA"),
                          ),
                          DropdownMenuItem(
                            value: "AUS",
                            child: Text("AUS"),
                          ),
                          DropdownMenuItem(
                            value: "UAE",
                            child: Text("UAE"),
                          ),
                        ],
                        onChanged: (value) {
                          dropdown = value;
                          setState(() {});
                        }),
                    //button floting
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.strapwatch);
                      },
                      child: Icon(Icons.watch_outlined, color: Colors.white),
                      backgroundColor: Colors.pinkAccent[100],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
