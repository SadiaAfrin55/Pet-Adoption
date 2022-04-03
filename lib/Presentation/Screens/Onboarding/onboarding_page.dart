
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/page_one.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/page_three.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/page_two.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            enableSideReveal: true,
            liquidController: controller,
            slideIconWidget: const Icon(Icons.arrow_back_ios,color: Colors.white),
            pages: [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),

        ],
      ),
    );
  }
}
