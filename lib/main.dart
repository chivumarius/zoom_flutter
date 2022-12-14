import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
          child: Text(
        'Hello World!',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
