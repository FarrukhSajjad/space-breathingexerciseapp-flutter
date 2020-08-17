import 'package:flutter/material.dart';

class CalmSchedule extends StatelessWidget {
  final String instruction;

  CalmSchedule({
    this.instruction,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Text(
          '$instruction',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
