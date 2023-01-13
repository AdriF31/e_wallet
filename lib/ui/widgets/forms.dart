import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType inputType;
  final int? maxLength;
  final bool isShowTitle;
  const CustomFormField(
      {Key? key,
      required this.title,
      this.isPassword = false,
      this.controller,
      this.inputType = TextInputType.emailAddress,
      this.maxLength,
      this.isShowTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowTitle == true
            ? Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            : const SizedBox(
                height: 8,
              ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: isShowTitle == false ? title : '',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              contentPadding: const EdgeInsets.all(12)),
          obscureText: isPassword,
          keyboardType: inputType,
          maxLength: maxLength,
        )
      ],
    );
  }
}
