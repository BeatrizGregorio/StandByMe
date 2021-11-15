//import 'dart:js';
//import 'dart:js_util';

import 'package:flutter/widgets.dart';
import 'package:standbyme_tcc/models/Conta.dart';
import 'package:standbyme_tcc/screens/bank/add_card.dart';
import 'package:standbyme_tcc/screens/bank/add_transaction.dart';
import 'package:standbyme_tcc/screens/bank/edit_card.dart';
import 'package:standbyme_tcc/screens/cartoes/cartoes.dart';
import 'package:standbyme_tcc/screens/despensa/despensa.dart';
import 'package:standbyme_tcc/screens/home/home_screen.dart';
import 'package:standbyme_tcc/screens/initial/inital_screen.dart';
import 'package:standbyme_tcc/screens/login_success/login_sucess_screen.dart';
import 'package:standbyme_tcc/screens/profile/profile_screen.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/screens/sign_up/sign_up_screen.dart';
import 'package:standbyme_tcc/screens/splash/splash_screen.dart';
import 'package:standbyme_tcc/screens/list/list.dart';
import 'package:standbyme_tcc/screens/graphics/graphics.dart';
import 'package:standbyme_tcc/screens/settings/settings.dart';
import 'package:standbyme_tcc/screens/myInfo/myInfo.dart';
import 'package:standbyme_tcc/screens/contas/contas.dart';
import 'package:standbyme_tcc/screens/transacoes/transacoes.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  InitialScreen.routeName: (context) => InitialScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSucessScreen.routeName: (context) => LoginSucessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ListCompras.routeName: (context) => ListCompras(),
  Despensa.routeName: (context) => Despensa(),
  TransacoesScreen.routeName: (context) => TransacoesScreen(),
  CartoesScreen.routeName: (context) => CartoesScreen(),
  Graphics.routeName: (context) => Graphics(),
  Settings.routeName: (context) => Settings(),
  AddCard.routeName: (context) => AddCard(),
  AddTransaction.routeName: (context) => AddTransaction(),
  EditCard.routeName: (context) => EditCard(),
  MyInfo.routeName: (context) => MyInfo(),
  ContasScreen.routeName: (context) => ContasScreen()
};
