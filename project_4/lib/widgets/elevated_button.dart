import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressedFunc, this.icon,
  });
  final String text;
  final Color color;
  final IconData? icon;

  final Function() onPressedFunc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            minimumSize: const Size(400, 60),
            backgroundColor: color),
        onPressed: onPressedFunc,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
