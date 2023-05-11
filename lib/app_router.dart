import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nft_app/MarketPlace.dart';
import 'package:nft_app/Onboarding/page1.dart';
import 'package:nft_app/Onboarding/page2.dart';
import 'package:nft_app/Onboarding/page3.dart';
import 'package:nft_app/main.dart';
import 'package:nft_app/wallet/wallet_widget.dart';

class AppRouter {
  static getRouter() {
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          name: "home",
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return MarketPlace();
          },
          routes: <RouteBase>[
            GoRoute(
              name: "wallet",
              path: 'wallet',
              builder: (BuildContext context, GoRouterState state) {
                return const Wallet(title: "");
              },
            ),
            GoRoute(
              path: 'page1',
              builder: (BuildContext context, GoRouterState state) {
                return const page1();
              },
            ),
            GoRoute(
              path: 'page2',
              builder: (BuildContext context, GoRouterState state) {
                return page2();
              },
            ),
            GoRoute(
              path: 'page3',
              builder: (BuildContext context, GoRouterState state) {
                return page3();
              },
            ),
          ],
        ),
      ],
    );
    return _router;
  }
}
