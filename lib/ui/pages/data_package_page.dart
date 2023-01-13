import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/forms.dart';
import 'package:e_wallet/ui/widgets/provider_package_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            alignment: WrapAlignment.center,
            children: [
              ProviderPackageItem(
                amount: 40,
                price: 50000,
                onTap: () {},
              ),
              ProviderPackageItem(
                amount: 40,
                price: 75000,
                onTap: () {},
              ),
              ProviderPackageItem(
                amount: 80,
                price: 100000,
                onTap: () {},
              ),
              ProviderPackageItem(
                amount: 100,
                price: 5000000,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 57,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin-page') == true) {
                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data-package-success', ((route) => false));
              }
            },
          )
        ],
      ),
    );
  }
}
