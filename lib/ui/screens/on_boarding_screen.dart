import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/physician_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [secondaryColor, primaryColor, secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AnimatedSplashScreen(
        splashIconSize: 300.0,
        disableNavigation: true,
        splash: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 300.0,
              width: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 235.0,
                ),
                Expanded(
                  child: DefaultTextStyle(
                    style: txtTheme(context).headlineMedium!.copyWith(
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(5, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'CPI',
                          speed: const Duration(seconds: 1),
                        ),
                        FadeAnimatedText(
                          'Clinical',
                          duration: const Duration(seconds: 2),
                        ),
                        FadeAnimatedText(
                          'Pharmacist',
                          duration: const Duration(seconds: 2),
                        ),
                        FadeAnimatedText(
                          'Intervention',
                          duration: const Duration(seconds: 2),
                        ),
                      ],
                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,
                      onNextBeforePause: (int index, bool isLast) {
                        if (isLast) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 4000),
                              type: PageTransitionType.theme,
                              child: const PhysicianScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        nextScreen: const PhysicianScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
