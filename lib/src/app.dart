import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_z_flutter/src/views/Onboarding.dart';
import 'package:project_z_flutter/src/views/SplashScreen.dart';

import 'views/Detail.dart';
import 'views/Home.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {

    // Glue the SettingsController to the MaterialApp.
    return FutureBuilder(
      // Display a loading icon for 2 seconds.
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SplashScreen();
      } else {
        return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: snapshot.connectionState == ConnectionState.done
          ? KeyedSubtree(
            key: ValueKey('mainApp'),
            child: MaterialApp(
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
              // Use the given SettingsController to drive the SettingsView.
              initialRoute: '/',
              routes: {
                SettingsView.routeName: (context) => SettingsView(controller: settingsController),
                Detail.routeName: (context) => Detail(),
                Home.routeName: (context) => settingsController.onboardingCompleted ? Home() : OnboardingScreen(settingsController: settingsController),
              },
            ),
          )
          : const KeyedSubtree(
            key: ValueKey('splashScreen'),
            child: SplashScreen(),
          ),
        );
      }
      },
    );
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    
  }
}

