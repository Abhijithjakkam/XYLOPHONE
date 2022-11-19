import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer player = AudioPlayer();
  void _init(int num) async {
    await player.setAsset('assets/tone$num.wav');
    player.play();
  }

  Expanded buildkey(Color col, int num) {
    return Expanded(
      child: TextButton(
        child: Container(),
        onPressed: () {
          _init(num);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(col),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildkey(Colors.red, 1),
              buildkey(Colors.deepOrange, 2),
              buildkey(Colors.yellow, 3),
              buildkey(Colors.green, 4),
              buildkey(Colors.teal, 5),
              buildkey(Colors.blue, 6),
              buildkey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
