import 'package:flutter/material.dart';
import 'package:project_4/models/watch_model.dart';

class ProductBackgroundWidget extends StatelessWidget {
  const ProductBackgroundWidget({
    super.key,
    required this.watch,
  });

  final Watch watch;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(550, 700),
                  topRight: Radius.elliptical(20, 55),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
              color: Color(0xfff9f8f8)),
        ),
        Positioned(
            left: 100,
            child: Image.asset(
              watch.image,
              height: 415,
            )),
      ],
    );
  }
}
