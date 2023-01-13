
import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/blocs/auth/auth_state.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:e_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController fullNameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      fullNameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            CustomFormField(title: 'Username', controller: usernameController),
            const SizedBox(height: 16),
            CustomFormField(title: 'Full Name', controller: fullNameController),
            const SizedBox(height: 16),
            CustomFormField(
                title: 'Email Address', controller: emailController),
            const SizedBox(height: 16),
            CustomFormField(
              title: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            CustomFilledButton(
              title: 'Update Now',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/edit-profile-success', (route) => false);
              },
            )
          ]),
        ),
      ),
    );
  }
}
