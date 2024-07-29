import 'package:flutter/material.dart';

class HelloRectangle extends StatelessWidget {
  final String message;

  HelloRectangle(this.message);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightGreen,
        height: 300,
        width: 300,
        child: Center(
          child: Text(
            this.message,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
