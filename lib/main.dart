import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/blocs/auth/auth_event.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/ui/pages/data_package_page.dart';
import 'package:e_wallet/ui/pages/data_package_success_page.dart';
import 'package:e_wallet/ui/pages/data_provider_page.dart';
import 'package:e_wallet/ui/pages/edit_pin_page.dart';
import 'package:e_wallet/ui/pages/edit_profile_page.dart';
import 'package:e_wallet/ui/pages/home_page.dart';
import 'package:e_wallet/ui/pages/onboarding_page.dart';
import 'package:e_wallet/ui/pages/pin_page.dart';
import 'package:e_wallet/ui/pages/profile_page.dart';
import 'package:e_wallet/ui/pages/profile_update_success_page.dart';
import 'package:e_wallet/ui/pages/sign_in_page.dart';
import 'package:e_wallet/ui/pages/sign_up_page.dart';
import 'package:e_wallet/ui/pages/sign_up_success.dart';
import 'package:e_wallet/ui/pages/splash_screen.dart';
import 'package:e_wallet/ui/pages/top_up_amount_page.dart';
import 'package:e_wallet/ui/pages/top_up_page.dart';
import 'package:e_wallet/ui/pages/top_up_success.dart';
import 'package:e_wallet/ui/pages/transfer_amount_page.dart';
import 'package:e_wallet/ui/pages/transfer_page.dart';
import 'package:e_wallet/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AuthGetCurrentUser())),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 600),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              routes: {
                '/': (context) => const SplashScreen(),
                '/onboarding': (context) => const OnBoardingPage(),
                '/sign-in': (context) => const SignInPage(),
                '/sign-up': (context) => const SignUpPage(),
                '/sign-up-success': (context) => const SignUpSuccessPage(),
                '/home': (context) => const HomePage(),
                '/profile': (context) => const ProfilePage(),
                '/pin-page': (context) => const PinPage(),
                '/edit-profile': (context) => const EditProfilePage(),
                '/edit-pin': (context) => const EditPinPage(),
                '/edit-profile-success': (context) =>
                const ProfileEditSuccessPage(),
                '/top-up': (context) => const TopUpPage(),
                '/top-up-amount': (context) => const TopUpAmountPage(),
                '/top-up-success': (context) => const TopUpSuccessPage(),
                '/transfer': (context) => const TransferPage(),
                '/transfer-amount': (context) => const TransferAmountPage(),
                '/transfer-success': (context) => const TransferSuccessPage(),
                '/data': (context) => const DataProviderPage(),
                '/data-package': (context) => const DataPackagePage(),
                '/data-package-success': (context) =>
                const DataPackageSuccessPage(),
              },
              debugShowCheckedModeBanner: false,
              title: 'E wallet',
              theme: ThemeData(
                  scaffoldBackgroundColor: lightBgColor,
                  appBarTheme: AppBarTheme(
                      backgroundColor: lightBgColor,
                      centerTitle: true,
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: blackColor,
                      ),
                      titleTextStyle: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold))),
            );
          }),
    );
  }
}
