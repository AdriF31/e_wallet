import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/blocs/auth/auth_event.dart';
import 'package:e_wallet/blocs/auth/auth_state.dart';


import 'package:e_wallet/models/sign_in_form_model.dart';
import 'package:e_wallet/shared/shared_methods.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/forms.dart';
import 'package:e_wallet/ui/widgets/minor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBgColor,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(color: redColor),
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const Logo(),
                const CustomText(
                  upperText: 'Sign In',
                  lowerText: '& Grow Your Finance',
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //email input field
                        CustomFormField(
                          title: 'Email Address',
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        //password input field
                        CustomFormField(
                          controller: passwordController,
                          title: 'Password',
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password',
                                style: blueTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomFilledButton(
                          title: 'Sign In',
                          onPressed: () {
                            if (validate()) {
                              context.read<AuthBloc>().add(AuthLogin(
                                  SignInFormModel(
                                      email: emailController.text,
                                      password: passwordController.text)));
                            } else {
                              showCustomSnackbar(
                                  context, 'Semua field harus diisi');
                            }
                          },
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextButton(
                  title: 'Create New Account',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-up', (route) => false);
                  },
                ),
              ],
            );
          },
        ));
  }
}
