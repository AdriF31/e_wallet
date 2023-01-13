import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({Key? key}) : super(key: key);

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController _amountController =
      TextEditingController(text: '0');

  addAmount(String number) {
    if (_amountController.text == '0') {
      _amountController.text = '';
    }
    setState(() {
      _amountController.text = _amountController.text + number;
    });
  }

  deleteAmount() {
    if (_amountController.text.isNotEmpty) {
      setState(() {
        _amountController.text = _amountController.text
            .substring(0, _amountController.text.length - 1);
        if (_amountController.text == '') {
          _amountController.text = '0';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() {
      _amountController.value = _amountController.value.copyWith(
          text: NumberFormat.currency(
                  locale: 'id', decimalDigits: 0, symbol: '')
              .format(int.parse(_amountController.text.replaceAll('.', ''))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBgColor,
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 58),
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Total Amount',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _amountController,
                    cursorColor: greyColor,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: Text(
                        'Rp ',
                        style: whiteTextStyle.copyWith(
                            fontSize: 36, fontWeight: medium),
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: greyColor)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                      title: '1',
                      onTap: () {
                        addAmount('1');
                      }),
                  CustomInputButton(
                      title: '2',
                      onTap: () {
                        addAmount('2');
                      }),
                  CustomInputButton(
                      title: '3',
                      onTap: () {
                        addAmount('3');
                      }),
                  CustomInputButton(
                      title: '4',
                      onTap: () {
                        addAmount('4');
                      }),
                  CustomInputButton(
                      title: '5',
                      onTap: () {
                        addAmount('5');
                      }),
                  CustomInputButton(
                      title: '6',
                      onTap: () {
                        addAmount('6');
                      }),
                  CustomInputButton(
                      title: '7',
                      onTap: () {
                        addAmount('7');
                      }),
                  CustomInputButton(
                      title: '8',
                      onTap: () {
                        addAmount('8');
                      }),
                  CustomInputButton(
                      title: '9',
                      onTap: () {
                        addAmount('9');
                      }),
                  const SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  CustomInputButton(
                      title: '0',
                      onTap: () {
                        addAmount('0');
                      }),
                  GestureDetector(
                    onTap: () {
                      deleteAmount();
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
              ),
              const SizedBox(
                height: 40,
              ),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () async {
                  if (await Navigator.pushNamed(context, '/pin-page') == true) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/transfer-success', ((route) => false));
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextButton(
                title: 'Terms & Condition',
                onPressed: () {},
              ),
            ]));
  }
}
