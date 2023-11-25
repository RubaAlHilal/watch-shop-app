import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_event.dart';
import 'package:project_4/blocs/cart/bloc/cart_state.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/custom_button.dart';
import 'components/details_page_main_widget.dart';
import 'components/details_screen_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.watch});

  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state is UpdateCartState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "${state.counter} items of (${watch.name}) has been added, total is: ${watch.count}"),
                ),
              );
            }
          },
          child: CustomButton(
            onPressedFunc: () {
              context.read<CartBloc>().add(AddItemFromDetailsEvent(watch));
            },
            content: "Add to Cart",
            hasIcon: true,
          ),
        ),
      ),
      appBar: detailsScreenAppBar(context: context, watch: watch),
      body: DetailsPageMainWidget(watch: watch),
    );
  }
}
