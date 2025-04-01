import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testapp/common/routes/routes.dart';
import 'package:testapp/features/authentication/ui/screens/login_screen.dart';
import 'package:testapp/features/onboarding/ui/screens/onboarding_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return PageTransition(
          child: const OnboardingScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: settings,
        );

      case Routes.loginScreen:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          alignment: Alignment.center,
        );

      default:
        return PageTransition(
          child: const OnboardingScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          alignment: Alignment.center,
        );
    }
  }
}
