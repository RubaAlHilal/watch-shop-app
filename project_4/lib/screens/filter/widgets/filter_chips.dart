import 'package:flutter/material.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({
    super.key,
    required this.chipList,
  });

  final List<String> chipList;

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

int selected = 0;

class _FilterChipsState extends State<FilterChips> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          widget.chipList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                selected = index;
                setState(() {});
              },
              child: Chip(
                backgroundColor: (selected == index)
                    ? const Color(0xfffccf78)
                    : const Color.fromARGB(255, 241, 241, 241),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.all(14),
                label: Text(widget.chipList[index]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
