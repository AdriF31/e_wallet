import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;
  const HomeServiceItem(
      {Key? key, required this.title, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 26,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }
}
