import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.iconData,
    required this.onPressedFunc,
  });

  final IconData iconData;
  final Function() onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFFAC672),
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
          child: IconButton(
            onPressed: onPressedFunc,
            icon: Icon(
              iconData,
            ),
          ),
        ),
      ),
    );
  }
}
