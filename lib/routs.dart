import 'package:flutter/widgets.dart';
import 'package:standbyme_tcc/screens/initial/inital_screen.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  InitialScreen.routeName: (context) => InitialScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
