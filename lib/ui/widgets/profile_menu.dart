import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const ProfileMenu(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        color: whiteColor,
        child: Row(children: [
          Image.asset(
            icon,
            width: 24,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )
        ]),
      ),
    );
  }
}
