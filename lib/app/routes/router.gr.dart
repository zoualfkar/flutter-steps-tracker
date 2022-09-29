// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ExchangeHistoryRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const ExchangeHistoryPage(),
      );
    },
    RankingRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const RankingPage(),
      );
    },
    RewardRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const RewardPage(),
      );
    },
    MyRewardRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const MyRewardPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        RouteConfig(
          ExchangeHistoryRoute.name,
          path: '/exchange-history-page',
        ),
        RouteConfig(
          RankingRoute.name,
          path: '/ranking-page',
        ),
        RouteConfig(
          RewardRoute.name,
          path: '/reward-page',
        ),
        RouteConfig(
          MyRewardRoute.name,
          path: '/my-reward-page',
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ExchangeHistoryPage]
class ExchangeHistoryRoute extends PageRouteInfo<void> {
  const ExchangeHistoryRoute()
      : super(
          ExchangeHistoryRoute.name,
          path: '/exchange-history-page',
        );

  static const String name = 'ExchangeHistoryRoute';
}

/// generated route for
/// [RankingPage]
class RankingRoute extends PageRouteInfo<void> {
  const RankingRoute()
      : super(
          RankingRoute.name,
          path: '/ranking-page',
        );

  static const String name = 'RankingRoute';
}

/// generated route for
/// [RewardPage]
class RewardRoute extends PageRouteInfo<void> {
  const RewardRoute()
      : super(
          RewardRoute.name,
          path: '/reward-page',
        );

  static const String name = 'RewardRoute';
}

/// generated route for
/// [MyRewardPage]
class MyRewardRoute extends PageRouteInfo<void> {
  const MyRewardRoute()
      : super(
          MyRewardRoute.name,
          path: '/my-reward-page',
        );

  static const String name = 'MyRewardRoute';
}
