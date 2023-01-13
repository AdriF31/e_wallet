
import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/blocs/auth/auth_state.dart';
import 'package:e_wallet/shared/shared_methods.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController _pinController = TextEditingController();
  String pin = '';
  bool isError = false;

  addPin(String number) {
    if (_pinController.text.length < 6) {
      setState(() {
        isError = false;
        _pinController.text = _pinController.text + number;
      });
    }
    if (_pinController.text.length == 6) {
      if (_pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnackbar(
            context, 'PIN yang anda masukkan salah, silahkan coba lagi');
        _pinController.text = '';
      }
    }
  }

  deletePin() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _pinController.text =
            _pinController.text.substring(0, _pinController.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBgColor,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Sha PIN',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 72,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: _pinController,
                cursorColor: greyColor,
                obscureText: true,
                style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                    color: isError ? redColor : whiteColor),
                obscuringCharacter: '*',
                enabled: false,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor)),
                ),
              ),
            ),
            const SizedBox(
              height: 66,
            ),
            Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                CustomInputButton(
                    title: '1',
                    onTap: () {
                      addPin('1');
                    }),
                CustomInputButton(
                    title: '2',
                    onTap: () {
                      addPin('2');
                    }),
                CustomInputButton(
                    title: '3',
                    onTap: () {
                      addPin('3');
                    }),
                CustomInputButton(
                    title: '4',
                    onTap: () {
                      addPin('4');
                    }),
                CustomInputButton(
                    title: '5',
                    onTap: () {
                      addPin('5');
                    }),
                CustomInputButton(
                    title: '6',
                    onTap: () {
                      addPin('6');
                    }),
                CustomInputButton(
                    title: '7',
                    onTap: () {
                      addPin('7');
                    }),
                CustomInputButton(
                    title: '8',
                    onTap: () {
                      addPin('8');
                    }),
                CustomInputButton(
                    title: '9',
                    onTap: () {
                      addPin('9');
                    }),
                const SizedBox(
                  height: 60,
                  width: 60,
                ),
                CustomInputButton(
                    title: '0',
                    onTap: () {
                      addPin('0');
                    }),
                GestureDetector(
                  onTap: () {
                    deletePin();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: numberBgColor),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        )));
  }
}
