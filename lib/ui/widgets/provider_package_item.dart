import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/cupertino.dart';

class ProviderPackageItem extends StatelessWidget {
  final int amount;
  final int price;
  final VoidCallback? onTap;
  final bool isSelected;

  const ProviderPackageItem(
      {Key? key,
      required this.amount,
      required this.price,
      this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            const SizedBox(
              height: 13,
            ),
            Text(
              '$amount GB',
              style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
            ),
            Text(
              'Rp $price',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            )
          ])),
    );
  }
}
