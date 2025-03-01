import 'package:flutter/material.dart';

Widget progressIndicator() {
  return Center(
    child: SizedBox(
      width: 150,
      child: Card(
        elevation: 3,
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(
            color: Colors.blueGrey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(3)),
          ),
        ),
      ),
    ),
  );
}
