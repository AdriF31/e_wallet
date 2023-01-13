import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/select_bank.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Up')),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Wallet',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Image.asset('assets/img_wallet.png', width: 80, height: 55),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '8008 2208 1996',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                      Text(
                        'Adray',
                        style: greyTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Select Bank',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 14,
              ),
              const SelectCard(
                  image: 'assets/img_bank_bca.png',
                  title: 'BANK BCA',
                  subtitle: '50 mins'),
              const SelectCard(
                  image: 'assets/img_bank_bni.png',
                  title: 'Bank BNI',
                  subtitle: '50 mins'),
              const SelectCard(
                  image: 'assets/img_bank_mandiri.png',
                  title: 'Bank Mandiri',
                  subtitle: '50 mins'),
              const SelectCard(
                  image: 'assets/img_bank_ocbc.png',
                  title: 'Bank OCBC',
                  subtitle: '50 mins'),
              const SizedBox(
                height: 12,
              ),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/top-up-amount');
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
