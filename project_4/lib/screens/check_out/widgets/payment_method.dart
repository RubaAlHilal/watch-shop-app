import 'package:flutter/material.dart';

import 'payment_method_row.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentMethodRow(
            imagePath: "assets/images/mastercard.png", paymentType: "Credit/Debit Card"),
        SizedBox(height: 8),
        PaymentMethodRow(imagePath: "assets/images/paypal.png", paymentType: "Paypal"),
      ],
    );
  }
}
