import 'package:flutter/material.dart';

import 'package:project_4/models/watch_model.dart';

import 'package:project_4/screens/NavigationBar/navigation_bar_widget.dart';
import 'package:project_4/screens/check_out/check_out_screen.dart';
import 'package:project_4/widgets/custom_button.dart';

import '../../data/global_data.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/my_order_list.dart';
import '../../widgets/payment_details.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, this.watch, required this.isBottomNavBar}) : super(key: key);
  final Watch? watch;

  @override
  State<OrderScreen> createState() => OrderScreenState();
  final bool isBottomNavBar;
}

class OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "My Order",
          context: context,
          hasAction: true,
          onPressedFunc: () {
            if (widget.isBottomNavBar) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
            } else {
              Navigator.pop(context);
            }
          }),
      body: WillPopScope(
        onWillPop: () {
          if (widget.isBottomNavBar) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
          } else {
            Navigator.pop(context);
          }
          return Future.value(true);
        },
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: (cartList.isNotEmpty)
                  ? const MyOrderList()
                  : Image.asset("assets/images/cart-empty.png"),
            ),
            const Expanded(flex: 2, child: PaymentDetails()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        content: 'Checkout',
        hasIcon: false,
        onPressedFunc: () {
          if (cartList.isNotEmpty) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOutScreen()))
                .then((value) {
              cartList.clear();
              itemsTotal.value = 0;
              grandTotal.value = 0;
              setState(() {});
            });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Your cart is empty")));
          }
        },
      ),
    );
  }
}
