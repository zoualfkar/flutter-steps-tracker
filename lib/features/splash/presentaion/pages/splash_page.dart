import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/app/routes/router.dart';
import 'package:steps_tracker/injections.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200)).then((value) {
    String? userId=   serviceLocator<AppSettings>().userId;

    if(userId==null) {
      context.router.replace(const LoginRoute());
    }else{
      context.router.replace(const HomeRoute());
    }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/splash_image.png",
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20,),
                Text(
                    'Steps Tracker',
                    style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
      ),);
  }
}
