import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultUserItem extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String name;
  final bool isVerified;
  final bool isSelected;
  const TransferResultUserItem(
      {Key? key,
      required this.name,
      required this.username,
      required this.imageUrl,
      required this.isVerified,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 14),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        width: 155,
        height: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: isSelected == true ? blueColor : whiteColor),
          color: whiteColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(imageUrl))),
              child: isVerified
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  : null),
          const SizedBox(
            height: 13,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          Text(
            username,
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ]));
  }
}
