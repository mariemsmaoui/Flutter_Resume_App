import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cv/main.dart';
import 'package:cv/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

class Splash_Animated extends StatelessWidget {
  const Splash_Animated({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/images/loading.json'),
        splashIconSize: 200,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: HomeScreen(),

// we can use
        duration: 5000,
//5000= 5 Second

//control the duration of the image , we can use
        animationDuration: const Duration(seconds: 3));
//small number : the duration will be speed
//large number : the duratiion will be slow);
  }
}
