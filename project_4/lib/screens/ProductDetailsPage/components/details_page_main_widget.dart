import 'package:flutter/material.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/circle_icon.dart';
import '../product_details_screen.dart';
import 'product_background_widget.dart';

class DetailsPageMainWidget extends StatefulWidget {
  const DetailsPageMainWidget({
    super.key,
    required this.watch,
  });
  final Watch watch;

  @override
  State<DetailsPageMainWidget> createState() => _DetailsPageMainWidgetState();
}

class _DetailsPageMainWidgetState extends State<DetailsPageMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductBackgroundWidget(
          watch: widget.watch,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.watch.name,
                            style: const TextStyle(
                                fontSize: 24, color: Color(0xff294475), fontFamily: 'DMSerifText'),
                          ),
                          Text(
                            "₹${widget.watch.price}",
                            style: const TextStyle(fontSize: 24, fontFamily: 'DMSerifText'),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CircleIcon(
                              iconData: Icons.remove,
                              onPressedFunc: () {
                                if (count == 1) {
                                } else {
                                  count--;
                                }
                                setState(() {});
                              }),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            //quantity
                            "$count",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CircleIcon(
                              iconData: Icons.add,
                              onPressedFunc: () {
                                count++;
                                setState(() {});
                              }),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.watch.description,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
