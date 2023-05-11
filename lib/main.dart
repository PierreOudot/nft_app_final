import 'package:flutter/material.dart';
import 'package:nft_app/MarketPlace.dart';
import 'package:nft_app/Onboarding/OnboardingPager.dart';
import 'package:nft_app/Onboarding/page2.dart';
import 'package:nft_app/Onboarding/page3.dart';
import 'package:nft_app/app_router.dart';
import 'package:nft_app/wallet/wallet_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppWrapper());

class AppWrapper extends StatefulWidget {
  AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool skipOnboarding = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getRouter(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(98, 0, 238, 1.0),
      ),
    );
  }

  void manageOnBoarding() {
    setState(() {
      skipOnboarding = !skipOnboarding;
      print(skipOnboarding);
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter - Basics';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(98, 0, 238, 1.0),
        buttonColor: Color.fromRGBO(3, 218, 197, 1.0),
      ),
      home: Scaffold(
        body: const OnboardingPager(),
      ),
      routes: {
        '/wallet': (context) => Wallet(title: ""),
      },
    );
  }
}
