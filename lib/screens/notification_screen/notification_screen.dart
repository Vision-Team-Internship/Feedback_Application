// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  String title;
  NotificationScreen({Key? key, required this.title}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  
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
