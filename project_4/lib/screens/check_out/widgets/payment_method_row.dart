import 'package:flutter/material.dart';

class PaymentMethodRow extends StatelessWidget {
  const PaymentMethodRow({
    super.key,
    required this.imagePath,
    required this.paymentType,
  });

  final String imagePath;
  final String paymentType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
        title: Text(paymentType),
        trailing: Transform.scale(
          scale: 1.4,
          child: Radio(
            value: 0,
            groupValue: const [],
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
