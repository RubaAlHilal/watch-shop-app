import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30))),
    );
  }
}
