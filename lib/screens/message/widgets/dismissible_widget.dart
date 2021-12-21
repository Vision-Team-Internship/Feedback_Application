// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final Widget child;
  final T item;
  final DismissDirectionCallback onDismissed;

  const DismissibleWidget({
    Key? key,
    required this.child,
    required this.item,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(item),
      background: buildSwipeActionLeft(),
      secondaryBackground: buildSwipeActionRight(),
      child: child,
      onDismissed: onDismissed,
    );
  }
}

Widget buildSwipeActionRight() {
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.red,
    child: Icon(
      Icons.delete_forever,
      color: Colors.white,
      size: 30,
    ),
  );
}

Widget buildSwipeActionLeft() {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.green,
    child: Icon(
      Icons.archive_sharp,
      color: Colors.white,
      size: 30,
    ),
  );
}
