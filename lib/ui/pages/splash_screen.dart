
import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Center(
            child: Container(
          width: 155,
          height: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img_logo_dark.png'))),
        )),
      ),
    );
  }
}
