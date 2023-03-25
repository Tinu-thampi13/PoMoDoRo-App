import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timerservice.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return Column(
      children: [
        Text(
          provider.currentState,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.white.withOpacity(0.8),
                        spreadRadius: 3,
                        offset: const Offset(0, 2)),
                  ]),
              child: Center(
                child: Text(
                  (provider.currentduration ~/ 60).toString(),
                  style: TextStyle(
                      color: renderColor(provider.currentState),
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              ':',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.white.withOpacity(0.8),
                        spreadRadius: 3,
                        offset: const Offset(0, 2)),
                  ]),
              child: Center(
                child: Text(
                  (provider.currentduration % 60) == 0
                      ? "${(provider.currentduration % 60).round()}0"
                      : (provider.currentduration % 60).round().toString(),
                  style: TextStyle(
                      color: renderColor(provider.currentState),
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Color renderColor(String currentState) {
  if (currentState == "FOCUS") {
    return Colors.redAccent;
  } else {
    return Colors.greenAccent;
  }
}
