import 'dart:convert';
import 'dart:io';

import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/shared/shared_methods.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/pages/sign_up_verify_id.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/forms.dart';
import 'package:e_wallet/ui/widgets/minor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfile extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpSetProfile> createState() => _SignUpSetProfileState();
}

class _SignUpSetProfileState extends State<SignUpSetProfile> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const Logo(),
        const CustomText(
          upperText: 'Join Us to Unlock',
          lowerText: 'Your Growth',
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final image = await selectImage();
                      setState(() {
                        selectedImage = image;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBgColor,
                        image: selectedImage == null
                            ? null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(
                                    selectedImage!.path,
                                  ),
                                ),
                              ),
                      ),
                      child: selectedImage != null
                          ? null
                          : Center(
                              child: Image.asset(
                                'assets/ic_upload.png',
                                width: 32,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Shayna Hanna',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                title: 'Set PIN (6 digit number)',
                isPassword: true,
                inputType: TextInputType.number,
                maxLength: 6,
                controller: pinController,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  if (validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpVerifyId(
                          data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,${base64Encode(
                                      File(selectedImage!.path)
                                          .readAsBytesSync(),
                                    )}'),
                        ),
                      ),
                    );
                  } else {
                    showCustomSnackbar(context, 'PIN harus 6 digit');
                  }
                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}
