import 'package:flutter/material.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/screens/check_out/widgets/payment_details_cost.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  void initState() {
    grandTotal.value = itemsTotal.value - discount;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<double>(
            valueListenable: itemsTotal,
            builder: (context, value, child) {
              return PaymentDetailsCost(
                leadingText: "Item Total",
                trailingText: "${itemsTotal.value}",
              );
            }),
        PaymentDetailsCost(
          leadingText: "Discount",
          trailingText: "$discount",
        ),
        const PaymentDetailsCost(
          leadingText: "Delivery Free",
          trailingText: "Free",
          color: Colors.green,
        ),
        const Divider(thickness: 1.5, indent: 20, endIndent: 20),
        ValueListenableBuilder<double>(
            valueListenable: grandTotal,
            builder: (context, value, child) {
              return PaymentDetailsCost(
                leadingText: "Grand Total",
                trailingText: "${grandTotal.value}",
              );
            }),
      ],
    );
  }
}
