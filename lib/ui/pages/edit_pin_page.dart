import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class EditPinPage extends StatelessWidget {
  const EditPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPinController = TextEditingController();
    final TextEditingController newPinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            CustomFormField(
                title: 'Old PIN',
                controller: oldPinController,
                isPassword: true),
            const SizedBox(height: 16),
            CustomFormField(
              title: 'Password',
              controller: newPinController,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            CustomFilledButton(
              title: 'Update Now',
              onPressed: () {},
            )
          ]),
        ),
      ),
    );
  }
}
