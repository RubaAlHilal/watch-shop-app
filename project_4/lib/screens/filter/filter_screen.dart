import 'package:flutter/material.dart';
import 'package:project_4/screens/check_out/widgets/title_row.dart';
import 'package:project_4/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../data/constants.dart';
import '../../widgets/custom_button.dart';
import 'widgets/filter_chips.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "All watches",
      "Metallic",
      "Leather",
      "Expensive",
      "Classic",
    ];
    List<String> sortBy = [
      "Price",
      "Rating",
      "Popularity",
      "Top Selling",
      "Deals & Discounts",
    ];

    return Scaffold(
      appBar: customAppBar(
        title: "Filter",
        context: context,
        hasAction: true,
        onPressedFunc: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleRow(content: "Select Categories"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilterChips(chipList: categories),
          ),
          const SizedBox(height: 10),
          const TitleRow(content: "Sort Watches By"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilterChips(chipList: sortBy),
          ),
          const SizedBox(height: 10),
          const TitleRow(content: "Select a Price Range"),
          const SizedBox(height: 10),
          SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
              thumbColor: Colors.white,
              activeTrackColor: Colors.orangeAccent,
            ),
            child: const FilterRangeSlider(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        content: 'Apply',
        hasIcon: false,
        onPressedFunc: () {},
      ),
    );
  }
}

class FilterRangeSlider extends StatefulWidget {
  const FilterRangeSlider({
    super.key,
  });

  @override
  State<FilterRangeSlider> createState() => _FilterRangeSliderState();
}

class _FilterRangeSliderState extends State<FilterRangeSlider> {
  var range = const SfRangeValues(350, 1100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfRangeSlider(
          inactiveColor: const Color.fromARGB(255, 241, 241, 241),
          min: 1,
          max: 2000,
          values: range,
          onChanged: (value) {
            range = SfRangeValues(value.start.round(), value.end.round());
            setState(() {});
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("$rupeeIcon${range.start}"),
            Text("$rupeeIcon${range.end}"),
          ],
        )
      ],
    );
  }
}
