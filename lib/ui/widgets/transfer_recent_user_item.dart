import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';


class TransferRecentUserItem extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String name;
  final bool isVerified;

  const TransferRecentUserItem(
      {Key? key,
      required this.name,
      required this.username,
      required this.imageUrl,
      required this.isVerified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      width: double.infinity,
      height: 89,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(22),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Image.asset(
              imageUrl,
              width: 45,
            ),
            const SizedBox(width: 14),
            Column(
              children: [
                Text(
                  name,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                Text(
                  '@$username',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        isVerified == true
            ? Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 14,
                    color: greenColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'verified',
                    style: greenTextStyle.copyWith(
                        fontSize: 11, fontWeight: medium),
                  )
                ],
              )
            : const SizedBox(),
      ]),
    );
  }
}
