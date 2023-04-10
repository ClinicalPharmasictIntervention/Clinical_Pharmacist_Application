import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Make Your Intervention here!",
          body:
              "We Help You To Make Intervention Easily To Get The Best Patient Care.",
          image: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/doc1.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/logo.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            titleTextStyle:
                txtTheme(context).titleLarge!.copyWith(fontSize: 29),
            bodyTextStyle: txtTheme(context).bodySmall!.copyWith(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: "Show Your Reports Every Time!",
          body:
              "You Can Show Your Reports That You Have Done With Patients To Track Your work.",
          image: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/doc2.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/logo.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            titleTextStyle:
                txtTheme(context).titleLarge!.copyWith(fontSize: 27),
            bodyTextStyle: txtTheme(context).bodySmall!.copyWith(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: "Communicate With Physicians!",
          body:
              "You Can Communicate Physician To Get Response Of Your Interventions.",
          image: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/doc3.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/logo.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: PageDecoration(
            titleTextStyle:
                txtTheme(context).titleLarge!.copyWith(fontSize: 27),
            bodyTextStyle: txtTheme(context).bodySmall!.copyWith(fontSize: 16),
          ),
        ),
      ],
      showNextButton: true,
      showSkipButton: true,
      skip: const Text("Skip"),
      done: const Text("Start"),
      onDone: () {},
      next: Text('Next'),
      dotsDecorator: const DotsDecorator(
        activeSize: Size.square(15.0),
      ),
    );
  }
}
