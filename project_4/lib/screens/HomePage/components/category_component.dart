import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List categoryList = ["Trending", "Popular", "New", "Best Collection"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return choice(index);
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
      ),
    );
  }

  choice(int index) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: Colors.transparent,
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: 70,
          child: Text(
            categoryList[index],
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: selectedIndex == index ? Colors.black : Colors.grey),
          ),
        ),
      ),
      selected: selectedIndex == index,
      selectedColor: const Color(0xfffccf78),
      onSelected: (value) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
