import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_app/Onboarding/page1.dart';
import 'package:nft_app/Onboarding/page2.dart';
import 'package:nft_app/Onboarding/page3.dart';

class OnboardingPager extends StatelessWidget {
  const OnboardingPager({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Container(
        color: const Color.fromARGB(255, 240, 239, 235),
        child: PageView(
          controller: controller,
          children: <Widget>[
            Center(child: page1()),
            Center(child: page2()),
            Center(
              child: page3(),
            ),
          ],
        ),
      ),
    );
  }
}