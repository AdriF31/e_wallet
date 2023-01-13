import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomCircleImage extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  const CustomCircleImage(
      {Key? key, this.width = 120, this.height = 120, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: lightGreyColor,
        shape: BoxShape.circle,
        
      ),
      child: Center(
          child: Image.asset(
        image,
        width: 32,
      )),
    );
  }
}
