import 'package:draggable_flutter/custom_draggable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Widget Demo',
      home: Container(
        color: Colors.white,
        child: DraggableDock(icons: [
          Image.asset("images/clock.png"),
          Image.asset("images/messenger.png"),
          Image.asset("images/picture.png"),
          Image.asset("images/schedule.png"),
          Image.asset("images/terminal.png"),
          Image.asset("images/vinyl-record.png"),
          Image.asset("images/pos-terminal.png"),

        ],),
      ),
    );
  }
}

