import 'package:flutter/material.dart';
import '../const.dart';

class MyButton extends StatelessWidget {
  final String child;
  var buttonColor = Colors.deepPurple[400];

  MyButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        color: Colors.deepPurple,
        child: Center(
          child: Text(
            child,
            style: whiteTextStyle,
          ),
        ),
      ),
    );
  }
}
