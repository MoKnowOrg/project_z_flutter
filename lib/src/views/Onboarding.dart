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

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding_1.png",
      "title": "Find a service",
      "subtitle": "Discover and book the best beauty services around you"
    },
    {
      "image": "assets/images/onboarding_2.png",
      "title": "Pick date and time",
      "subtitle": "Found a business? Now select a day and time that suits you"
    },
    {
      "image": "assets/images/onboarding_3.png",
      "title": "Start booking",
      "subtitle": "One button to confirm, and get ready to head off to your appointment"
    },
  ];

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() {
        _currentIndex++;
      });
    } else {
      // Navigate to the next screen or perform an action
      settingsController.onboardingCompleted = true;
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        data["image"] ?? '',
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        data["title"] ?? '',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        data["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.pink
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                _nextPage();
              },
              child: Text(
                _currentIndex == _onboardingData.length - 1
                    ? "Start Booking"
                    : "Next",
                style: const TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

