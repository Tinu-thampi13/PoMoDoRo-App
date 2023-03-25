import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro/screens/timerservice.dart';

import '../timerservice.dart';

class timeController extends StatefulWidget {
  const timeController({super.key});

  @override
  State<timeController> createState() => _timeControllerState();
}

class _timeControllerState extends State<timeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          onPressed: () {
            provider.timerPlaying
                ? Provider.of<timerservice>(context, listen: false).pause()
                : Provider.of<timerservice>(context, listen: false).start();
          },
          icon: provider.timerPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow_sharp),
          iconSize: 55,
          color: Colors.white,
        ),
      ),
    );
  }
}
