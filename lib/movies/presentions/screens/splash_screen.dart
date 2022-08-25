import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_tv_app/core/global/themes/app_color/app_color_dark.dart';
import 'package:movies_and_tv_app/movies/presentions/screens/movies_homeScreen.dart';
class SplashSCreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      backgroundColor: AppColorDark.backgroungColor,
      duration: 400,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/logo.png',width: 250,height: 150),),
          RichText(
              text: const TextSpan(
                  text: 'Watch',
                  style: TextStyle(
                    fontFamily: 'muli',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Movie',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ])),
        ],
      ),
      nextScreen: MoviesHomeScreen(),
      splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,


    );

  }
}
