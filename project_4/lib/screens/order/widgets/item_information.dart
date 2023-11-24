import 'package:flutter/material.dart';
import 'package:project_4/data/constants.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({
    super.key,
    required this.names,
    required this.description,
    required this.price,
    required this.index,
  });

  final List<String> names;
  final List<String> description;
  final List<double> price;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          names[index],
          style:
              const TextStyle(color: Color(0xFF233B66), fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Text(
          description[index],
          style: const TextStyle(color: Color(0xFF847F7F)),
        ),
        const SizedBox(height: 12),
        Text(
          "$rupeeIcon${price[index]}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
