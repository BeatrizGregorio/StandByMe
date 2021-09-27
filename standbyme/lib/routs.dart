//import 'dart:js';
//import 'dart:js_util';

import 'package:flutter/widgets.dart';
import 'package:standbyme_tcc/screens/bank/bank_card.dart';
import 'package:standbyme_tcc/screens/despensa/despensa.dart';
import 'package:standbyme_tcc/screens/home/home_screen.dart';
import 'package:standbyme_tcc/screens/initial/inital_screen.dart';
import 'package:standbyme_tcc/screens/login_success/login_sucess_screen.dart';
import 'package:standbyme_tcc/screens/profile/profile_screen.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/screens/sign_up/sign_up_screen.dart';
import 'package:standbyme_tcc/screens/splash/splash_screen.dart';
import 'package:standbyme_tcc/screens/list/list.dart';
import 'package:standbyme_tcc/screens/bank/cardhome.dart';
import 'package:standbyme_tcc/screens/graphics/graphics.dart';
import 'package:standbyme_tcc/screens/settings/settings.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  InitialScreen.routeName: (context) => InitialScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSucessScreen.routeName: (context) => LoginSucessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BankCard.routeName: (context) => BankCard(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ListCompras.routeName: (context) => ListCompras(),
  Despensa.routeName: (context) => Despensa(),
  CardHome.routeName: (context) => CardHome(),
  Graphics.routeName: (context) => Graphics(),
  Settings.routeName: (context) => Settings()
};
