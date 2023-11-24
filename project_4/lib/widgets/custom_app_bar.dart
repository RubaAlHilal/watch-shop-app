import 'package:flutter/material.dart';

customAppBar(
    {required String title,
    required BuildContext context,
    required bool hasAction,
    required Function() onPressedFunc}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20),
        onPressed: onPressedFunc),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    centerTitle: true,
    actions: [
      if (hasAction)
        IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
    ],
  );
}
