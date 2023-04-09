import 'package:clinical_pharmacist_intervention/presentation/physician_screen.dart';
import 'package:clinical_pharmacist_intervention/presentation/physician_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                ),
              ),
            ),
          ),
          const Text(
            'CPI',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Roboto Slab',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
