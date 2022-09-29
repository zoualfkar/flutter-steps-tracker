import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:steps_tracker/features/auth/presentaion/pages/login_page.dart';
import 'package:steps_tracker/features/home/presentaion/pages/exchange_history_page.dart';
import 'package:steps_tracker/features/home/presentaion/pages/home_page.dart';
import 'package:steps_tracker/features/home/presentaion/pages/my_rewards_page.dart';
import 'package:steps_tracker/features/home/presentaion/pages/ranking_page.dart';
import 'package:steps_tracker/features/splash/presentaion/pages/splash_page.dart';
import 'package:steps_tracker/features/home/presentaion/pages/get_rewards_page.dart';


part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[

    AutoRoute(
      path: '/',
      page: SplashPage,
    ),
    AutoRoute(page: LoginPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: ExchangeHistoryPage),
    AutoRoute(page: RankingPage),
    AutoRoute(page: RewardPage),
    AutoRoute(page: MyRewardPage),

    ])
class AppRouter extends _$AppRouter {}
