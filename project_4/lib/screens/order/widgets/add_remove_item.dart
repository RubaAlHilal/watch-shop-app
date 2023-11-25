import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_event.dart';
import 'package:project_4/blocs/cart/bloc/cart_state.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/circle_icon.dart';

class AddRemoveItem extends StatelessWidget {
  const AddRemoveItem({
    super.key,
    this.price,
    required this.watch,
  });

  final double? price;
  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleIcon(
            iconData: Icons.remove,
            onPressedFunc: () {
              context.read<CartBloc>().add(DecreseEvent(watch));
            }),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(
              "${state.counter}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            );
          },
        ),
        CircleIcon(
            iconData: Icons.add,
            onPressedFunc: () {
              context.read<CartBloc>().add(IncreseEvent(watch));
            }),
      ],
    );
  }
}
