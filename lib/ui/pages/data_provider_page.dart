import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/select_bank.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({Key? key}) : super(key: key);

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beli Data')),
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
                        'Balance Rp 190.000.000',
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
                'Select Provider',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 14,
              ),
              SelectCard(
                  image: 'assets/img_provider_telkomsel.png',
                  title: 'Telkomsel',
                  subtitle: 'Available',
                  onTap: () {
                    setState(() {});
                  }),
              SelectCard(
                  image: 'assets/img_provider_indosat.png',
                  title: 'Indosat',
                  subtitle: 'Available',
                  onTap: () {
                    setState(() {});
                  }),
              SelectCard(
                image: 'assets/img_provider_singtel.png',
                title: 'Singtel',
                subtitle: 'Available',
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/data-package');
                  }),
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
