import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.images,
    required this.index,
  });

  final List<String> images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .24,
          height: MediaQuery.of(context).size.height * .145,
          decoration: const BoxDecoration(
              color: Color(0xFFF7F6F6),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(60))),
        ),
        Positioned(
          right: 33,
          top: -23,
          child: Image.asset(
            fit: BoxFit.cover,
            images[index],
            scale: 5,
          ),
        ),
      ],
    );
  }
}
