import 'package:flutter/material.dart';
import 'package:pomodoro/screens/timerservice.dart';
import 'package:pomodoro/screens/widgets/timercard.dart';
import 'package:provider/provider.dart';

class timerOptions extends StatelessWidget {
  List selectableTimes = [
    "300",
    "600",
    "900",
    "1200",
    "1500",
    "1800",
    "2100",
    "2400",
    "2700",
    "3000",
    "3300",
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15))
                  : BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white30),
                      borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text((int.parse(time) ~/ 60).toString(),
                    style: int.parse(time) == provider.selectedTime
                        ? TextStyle(
                            fontSize: 20,
                            color: renderColor(provider.currentState),
                          )
                        : const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
