// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';

class Notification1 extends StatefulWidget {
  String title;
  Notification1({Key? key, required this.title}) : super(key: key);

  @override
  _Notification1State createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(widget.title)
        ),
      ),
    );
  }
}
