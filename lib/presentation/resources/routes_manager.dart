import 'package:advanced_flutter/app/denpendeny_injection.dart';
import 'package:advanced_flutter/presentation/forgot_password/forgot_password_screen.dart';
import 'package:advanced_flutter/presentation/home/home_screen.dart';
import 'package:advanced_flutter/presentation/login/view/login_view.dart';
import 'package:advanced_flutter/presentation/onboarding/onboarding_view.dart';
import 'package:advanced_flutter/presentation/register/register_screen.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/splash/splash_view.dart';
import 'package:advanced_flutter/presentation/store_details/store_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String storeDetailsRoute = '/storeDetails';
  static const String onBoardingRoute = '/onBoarding';
  static const String forgotPasswordRoute = '/forgotPassword';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case Routes.registerRoute:
      return MaterialPageRoute(builder: (_) =>const RegisterScreen ());
      case Routes.storeDetailsRoute:
      return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());
      case Routes.loginRoute:
        initLoginModule();
      return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return undefinedRoute();

    }
  }
  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (_)=>const Scaffold(
      body: Text(AppStrings.errorRoute),
    ));
  }
}
