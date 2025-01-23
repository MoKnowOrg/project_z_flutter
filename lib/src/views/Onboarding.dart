import 'package:flutter/material.dart';
import 'package:project_z_flutter/src/settings/settings_controller.dart';

class OnboardingScreen extends StatefulWidget {
  final SettingsController settingsController;

  OnboardingScreen({required this.settingsController});

  @override
  _OnboardingScreenState createState() =>
      _OnboardingScreenState(settingsController: settingsController);
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  _OnboardingScreenState({
    required this.settingsController,
  });

  final SettingsController settingsController;

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _corosalTexts = [
    "Welcome to our app! Discover amazing features.",
    "Stay connected with your friends and family.",
    "Get started and enjoy the experience!"
  ];

  void _nextPage() {
    if (_currentIndex < _corosalTexts.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      // Go to the next screen or perform an action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: _corosalTexts.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _corosalTexts[index],
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              if (index == _corosalTexts.length - 1)
                ElevatedButton(
                  onPressed: () {
                    // Start the app
                    settingsController.onboardingCompleted = true;
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text("Start"),
                ),
              if (index < _corosalTexts.length - 1)
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text("Next"),
                ),
            ],
          );
        },
      ),
    );
  }
}
