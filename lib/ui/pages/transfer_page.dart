import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/forms.dart';
import 'package:e_wallet/ui/widgets/transfer_recent_user_item.dart';
import 'package:e_wallet/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          Text('Search',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // buildRecentUser(),
          buildResult(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          )
        ],
      ),
    );
  }

  Widget buildRecentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Recent User',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
        const SizedBox(
          height: 14,
        ),
        const TransferRecentUserItem(
            name: 'Adri',
            username: 'Adray',
            imageUrl: 'assets/img_friend1.png',
            isVerified: true),
        const TransferRecentUserItem(
            name: 'Adri',
            username: 'Adray',
            imageUrl: 'assets/img_friend2.png',
            isVerified: false),
      ]),
    );
  }

  Widget buildResult() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              TransferResultUserItem(
                name: 'Adri',
                username: 'Adray',
                imageUrl: 'assets/img_friend1.png',
                isVerified: true,
                isSelected: true,
                
              ),
              TransferResultUserItem(
                  name: 'Adri',
                  username: 'Adray',
                  imageUrl: 'assets/img_friend1.png',
                  isVerified: false),
            ],
          ),
        ],
      ),
    );
  }
}
