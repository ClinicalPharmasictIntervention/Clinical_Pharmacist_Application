import 'package:clinical_pharmacist_intervention/shared/network/local/cache_helper.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';

import 'package:clinical_pharmacist_intervention/ui/screens/register_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        drawPageViewModel(
          context,
          title: "Make Your Intervention here!",
          body:
              "We Help You To Make Intervention Easily To Get The Best Patient Care.",
          imagePath: 'assets/images/doc1.jpg',
        ),
        drawPageViewModel(
          context,
          title: "Show Your Reports Every Time!",
          body:
              "You Can Show Your Reports That You Have Done With Patients To Track Your work.",
          imagePath: 'assets/images/doc2.jpg',
        ),
        drawPageViewModel(
          context,
          title: "Communicate With Physicians!",
          body:
              "You Can Communicate Physician To Get Response Of Your Interventions.",
          imagePath: 'assets/images/doc3.jpg',
        ),
      ],
      showNextButton: true,
      showSkipButton: true,
      skip: const Text("Skip"),
      done: const Text("Let.'s Go"),
      onDone: () {
        CacheHelper.savaDate(key: 'onBoarding', value: true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      onSkip: () {
        CacheHelper.savaDate(key: 'onBoarding', value: true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
      next: const Text('Next'),
      dotsDecorator: const DotsDecorator(
        activeSize: Size.square(15.0),
      ),
    );
  }

  drawPageViewModel(
    BuildContext context, {
    String? title,
    String? body,
    String? imagePath,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Image.asset(
              imagePath!,
              width: MediaQuery.of(context).size.width,
            ),
          ),
         const Padding(
            padding:  EdgeInsets.all(17.0),
            child: SizedBox(
              height: 100.0,
              width: 100.0,
              child:  Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: PageDecoration(
        titleTextStyle: txtTheme(context).titleLarge!.copyWith(fontSize: 29),
        bodyTextStyle: txtTheme(context).bodySmall!.copyWith(
              fontSize: 16,
              fontFamily: Lora,
            ),
      ),
    );
  }
}
