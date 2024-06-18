
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int hour = 0;

  int min = 0;

  int sec = 0;

  bool stop = false;

  List history = [];

  void Timer() async {
    stop = true;
    await Future.delayed(const Duration(milliseconds: 100), () {
      sec++;
      if (stop) {
        sec++;
      }
      if (sec > 59) {
        sec = 0;
        min++;
      }
      if (sec > 59) {
        min = 0;
        hour++;
      }
      if (hour >= 12) {
        hour = 0;
      }
      setState(() {});
    });
    if (stop) {
      Timer();
    }
  }

  @override
  Widget build(BuildContext context) {
    TextScaler taxtscaler = MediaQuery.of(context).textScaler;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stop Watch"), 
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Expanded(
           child: Column(
             children: [
               Stack(
                 alignment: Alignment.center,
                 children: [
                   Transform.scale(
                     scale: 6.3,
                     child: CircularProgressIndicator(
                       strokeWidth: 1.5,
                       value: sec / 60,
                       color: Colors.pinkAccent,
                     ),
                   ),
                   Text(
                     "${(hour).toString().padLeft(2, "0")} : ${(min).toString().padLeft(2, "0")} : ${(sec).toString().padLeft(2, "0")}",
                     style: const TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontSize: 35,
                       letterSpacing: 1,
                       wordSpacing: 2,
                       shadows: [
                         Shadow(
                           color: Colors.black,
                           offset: Offset(2, 3.7),
                         )
                       ],
                     ),
                   ),
                 ],
               ),
               SizedBox(
                 height: h * 0.1,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.pinkAccent,
                       shadowColor: Colors.black,
                       elevation: 5,
                     ),
                     onPressed: () {
                       if (!stop) {
                         Timer();
                       }
                       //  Timer();
                       setState(() {});
                     },
                     child: const Text(
                       "Start",
                       style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                       ),
                     ),
                   ),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.pinkAccent,
                       shadowColor: Colors.black,
                       elevation: 5,
                     ),
                     onPressed: () {
                       stop = false;
                       history.add({
                         'hour': hour,
                         'min': min,
                         'sec': sec,
                       });
                       setState(() {});
                     },
                     child: const Text(
                       "Stop",
                       style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                       ),
                     ),
                   ),
                 ],
               ),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.pinkAccent,
                   shadowColor: Colors.black,
                   elevation: 5,
                 ),
                 onPressed: () {
                   stop = false;
                   hour = min = sec = 0;
                   history = [];
                   setState(() {});
                 },
                 child: const Text(
                   "Reset",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 16,
                   ),
                 ),
               ),
             ],
           ),
         ),
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 ...history.map(
                       (e) => Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Hour : ${e['hour']} : "),
                         Text("Min : ${e['min']} : "),
                         Text("Sec : ${e['sec']}"),
                         SizedBox(width: w * 0.01,),
                         IconButton(onPressed: (){
                           history.remove(e);
                           setState(() {});
                         }, icon: Icon(
                           Icons.delete,
                           size: 25,
                         )),
                       ],
                     ),
                   ),
                 )
               ],
             ),
           ),
         ),
        ],
      ),
    );
  }
}
