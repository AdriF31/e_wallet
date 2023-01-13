import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 155,
        margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 110),
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/img_logo_light.png')),
        ));
  }
}

class CustomText extends StatelessWidget {
  final String? upperText;
  final String? lowerText;
  const CustomText({Key? key, this.upperText, this.lowerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$upperText\n$lowerText',
      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
    );
  }
}
