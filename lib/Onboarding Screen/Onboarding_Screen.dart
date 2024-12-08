import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mindsphere/Sign%20in%20Screen/login.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        next: const Icon(
          Icons.arrow_right_alt_outlined,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        showSkipButton: true,
        skip: const Text('Skip'),
        onSkip: () {
          gotoHomePage(context);
        },
        done: const Text('Done'),
        onDone: () {
          gotoHomePage(context);
        },
        pages: [
          PageViewModel(
            decoration: const PageDecoration(
              bodyTextStyle: TextStyle(
                fontSize: 20,
              ),
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              imagePadding: EdgeInsets.only(top: 80),
            ),
            title: 'Discover Experienced Doctors & AI Chat',
            body: 'Find top doctors and get AI-powered health support in one place.',
            image: Image.asset('assets/onboarding.png'),
          ),
          PageViewModel(
            decoration: const PageDecoration(
              bodyTextStyle: TextStyle(
                fontSize: 20,
              ),
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              imagePadding: EdgeInsets.only(top: 80),
            ),
            title: 'Effortless Appointment Booking',
            body: 'Book appointments effortlessly with top doctors and AI support.',
            image: Image.asset('assets/onboarding2.png'),
          ),
          PageViewModel(
            decoration: const PageDecoration(
              bodyTextStyle: TextStyle(
                fontSize: 20,
              ),
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              imagePadding: EdgeInsets.only(top: 80),
            ),
            title: 'All-in-One Health AI Assistant',
            body: 'Your all-in-one solution for symptom checks, report analysis, emotional wellness, voice assistance, and offline calls.',
            image: Image.asset('assets/onboarding3.png'),
          )
        ],
      ),
    );
  }

  void gotoHomePage(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogIn(),
        ));
  }
}