import 'package:flutter/material.dart';
import 'package:finsor/pages/introduction_pages.dart';
import 'package:finsor/theme/colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        backgroundColor: backgroundColor,
        splash: Container(
            child: Column(
          children: [
            Text(
              "finsor",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "the only financial advisor you'll ever need",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ],
        )),
        nextScreen: IntroductionPages(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade);
  }
}
