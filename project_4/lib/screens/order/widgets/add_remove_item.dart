import 'package:flutter/material.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/circle_icon.dart';

import 'my_order_list.dart';

class AddRemoveItem extends StatefulWidget {
  const AddRemoveItem({
    super.key,
    this.price,
    required this.watch,
  });

  final double? price;
  final Watch watch;

  @override
  State<AddRemoveItem> createState() => _AddRemoveItemState();
}

class _AddRemoveItemState extends State<AddRemoveItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleIcon(
            iconData: Icons.remove,
            onPressedFunc: () {
              if (widget.watch.count == 1) {
                cartList.remove(widget.watch);
                itemsTotal.value -= widget.watch.price;
                grandTotal.value = (itemsTotal.value - discount);
              } else {
                widget.watch.count = widget.watch.count - 1;
                itemsTotal.value -= widget.watch.price;
                grandTotal.value = (itemsTotal.value - discount);
              }
              setState(() {});
              context.findAncestorStateOfType<MyOrderListState>()!.setState(() {});
            }),
        Text(
          "${widget.watch.count}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        CircleIcon(
            iconData: Icons.add,
            onPressedFunc: () {
              itemsTotal.value += widget.watch.price;
              grandTotal.value = (itemsTotal.value - discount);
              widget.watch.count = widget.watch.count + 1;
              setState(() {});
              context.findAncestorStateOfType<MyOrderListState>()!.setState(() {});
            }),
      ],
    );
  }
}
