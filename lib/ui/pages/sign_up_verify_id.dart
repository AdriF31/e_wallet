import 'dart:convert';
import 'dart:io';
import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/blocs/auth/auth_event.dart';
import 'package:e_wallet/blocs/auth/auth_state.dart';
import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/shared/shared_methods.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/minor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpVerifyId extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpVerifyId({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpVerifyId> createState() => _SignUpVerifyIdState();
}

class _SignUpVerifyIdState extends State<SignUpVerifyId> {
  XFile? selectedImage;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/sign-up-success');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const Logo(),
              const CustomText(
                upperText: 'Verify Your',
                lowerText: 'Account',
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
                          onTap: () {
                            selectImage();
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
                          'Passport/ID Card',
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () async {
                        if (selectedImage != null) {
                          context.read<AuthBloc>().add(AuthRegister(
                                widget.data.copyWith(
                                    pin: '${widget.data.pin}',
                                    profilePicture:
                                        widget.data.profilePicture,
                                    ktp: 'data:image/png;base64,${base64Encode(
                                      File(selectedImage!.path)
                                          .readAsBytesSync(),
                                    )}'),
                              ));
                        } else if (selectedImage == null) {
                          showCustomSnackbar(
                              context, 'Gambar tidak boleh kosong');
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextButton(
                title: 'Skip For Now',
                onPressed: () {
                  context.read<AuthBloc>().add(AuthRegister(widget.data));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
