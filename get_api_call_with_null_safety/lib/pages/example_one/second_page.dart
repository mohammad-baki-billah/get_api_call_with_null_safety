import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required String title});

  String get title => '';

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Text(
            widget.title,
          ),
        ],
      ),
    );
  }
}
