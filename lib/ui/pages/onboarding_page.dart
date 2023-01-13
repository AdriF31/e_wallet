import 'package:e_wallet/shared/theme.dart';

import 'package:e_wallet/ui/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];
  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: [
              Image.asset(
                'assets/img_onboarding1.png',
                height: 331,
              ),
              Image.asset(
                'assets/img_onboarding2.png',
                height: 331,
              ),
              Image.asset(
                'assets/img_onboarding3.png',
                height: 331,
              ),
            ],
            options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            carouselController: carouselController,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 327,
            height: 220.h,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(
                  20,
                )),
            child: Column(children: [
              Text(
                titles[currentIndex],
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                subtitles[currentIndex],
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: currentIndex != 2 ? 50 : 38,
              ),
              currentIndex == 2
                  ? Column(
                      children: [
                        CustomFilledButton(
                          title: 'Get Started',
                          onPressed: () {
                            carouselController.nextPage();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextButton(
                          title: 'Sign In',
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/sign-in', (route) => false);
                          },
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  currentIndex == 0 ? blueColor : lightBgColor),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  currentIndex == 1 ? blueColor : lightBgColor),
                        ),
                        Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  currentIndex == 2 ? blueColor : lightBgColor,
                            )),
                        const Spacer(),
                        CustomFilledButton(
                          title: 'Continue',
                          width: 150,
                          onPressed: () {
                            carouselController.nextPage();
                          },
                        ),
                      ],
                    )
            ]),
          )
        ],
      )),
    );
  }
}
