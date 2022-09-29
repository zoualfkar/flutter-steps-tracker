import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/constants/const.dart';
import '../../core/utils/managers/fore_ground_service/fore_ground_service.dart';
import '../../core/utils/managers/graphql/graphql_manger.dart';
import '../../injections.dart';
import '../logic/app_bloc.dart';
import '../logic/app_settings.dart';
import '../logic/app_state.dart';
import '../routes/router.dart';
import '../theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! most called here to set the selected language other parts in the app depend on it.
    serviceLocator<AppSettings>().changeSelectedLanguage(context.locale);
    //!

    serviceLocator<ForeGroundService>().init();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => serviceLocator<AppBloc>(),
        ),

      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, AppState state) {


          return  GraphQLProvider(
              client:  serviceLocator<GraphQlManger>().clientNotifier,
              child:MaterialApp.router(
                localeResolutionCallback: (
                    locale,
                    supportedLocales,
                    ) {
                  return locale;
                },
              builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: kWebBG),
            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: serviceLocator<AppSettings>()
                .selectedThemeModeData
                .themeModeData,
            darkTheme: AppTheme(context: context).getDarkThemeData(),
            theme: AppTheme(context: context).getLightThemeData(),
            routerDelegate: AutoRouterDelegate(
              serviceLocator<AppRouter>(),
            ),
            routeInformationParser:
                serviceLocator<AppRouter>().defaultRouteParser(),
          ));
        },
      ),
    );
  }



}
