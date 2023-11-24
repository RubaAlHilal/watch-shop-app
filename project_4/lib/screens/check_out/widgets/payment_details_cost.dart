import 'package:flutter/material.dart';
import 'package:project_4/data/constants.dart';

class PaymentDetailsCost extends StatelessWidget {
  const PaymentDetailsCost({
    super.key,
    required this.leadingText,
    required this.trailingText,
    this.color,
  });

  final String leadingText;
  final String trailingText;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leadingText,
        style: TextStyle(
            fontSize: 16,
            color: color ?? Colors.black,
            fontWeight: leadingText.contains("Grand") ? FontWeight.bold : FontWeight.normal),
      ),
      trailing: Text(!trailingText.contains("Free") ? "$rupeeIcon$trailingText" : trailingText,
          style: TextStyle(
              fontSize: 16,
              color: color ?? Colors.black,
              fontWeight: leadingText.contains("Grand") ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
