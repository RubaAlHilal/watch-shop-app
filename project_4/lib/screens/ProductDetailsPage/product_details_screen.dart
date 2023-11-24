import 'package:flutter/material.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/custom_button.dart';
import 'components/details_page_main_widget.dart';
import 'components/details_screen_app_bar.dart';
import 'components/method/add_item_to_list_method.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.watch});

  final Watch watch;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

int count = 1;

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    count = 1;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: CustomButton(
          onPressedFunc: () {
            addItemToCartFromDetails(widget.watch, count);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "$count items of (${widget.watch.name}) has been added, total is: ${widget.watch.count}"),
              ),
            );
          },
          content: "Add to Cart",
          hasIcon: true,
        ),
      ),
      appBar: detailsScreenAppBar(context: context, watch: widget.watch),
      body: DetailsPageMainWidget(watch: widget.watch),
    );
  }
}
