import 'package:flutter/material.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/screens/HomePage/components/product_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: watchesList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ProductWidget(
                  watch: watchesList[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

