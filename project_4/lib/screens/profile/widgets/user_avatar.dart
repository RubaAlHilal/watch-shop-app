import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          radius: 50,
          foregroundImage: AssetImage("assets/images/profile_avatar.png"),
        ),
        Positioned(
            right: -5,
            top: -5,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                  color: Color(0xFFFAC672), borderRadius: BorderRadius.all(Radius.circular(35))),
              child: IconButton(
                iconSize: 22,
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ))
      ],
    );
  }
}
