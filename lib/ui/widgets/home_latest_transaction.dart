import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/cupertino.dart';

class HomeLatestTransaction extends StatelessWidget {
  final String icon;
  final String date;
  final String transaction;
  final String number;
  const HomeLatestTransaction(
      {Key? key,
      required this.icon,
      required this.transaction,
      required this.date,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      height: 48,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                width: 48,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction,
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    date,
                    style: greyTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          Text(
            number,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ],
      ),
    );
  }
}
