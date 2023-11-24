import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
    required this.content,
  });

  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: Text(
          content,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}
