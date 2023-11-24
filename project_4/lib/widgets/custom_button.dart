import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.content,
      required this.hasIcon,
      this.onPressedFunc})
      : super(key: key);

  final String content;
  final bool hasIcon;
  final Function()? onPressedFunc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFFFCCF78),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressedFunc,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon,
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              content,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
