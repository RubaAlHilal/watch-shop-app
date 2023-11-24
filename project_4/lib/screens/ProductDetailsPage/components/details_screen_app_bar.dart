import 'package:flutter/material.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/screens/order/order_screen.dart';

PreferredSizeWidget detailsScreenAppBar({required BuildContext context, required Watch watch}) {
  return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: const Icon(
              Icons.shopping_basket_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderScreen(isBottomNavBar: false)));
            }),
        const SizedBox(
          width: 12,
        )
      ],
      title: Text(
        watch.name,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
      ));
}
