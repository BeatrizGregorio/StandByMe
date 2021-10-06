import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:standbyme_tcc/routs.dart';
import 'package:standbyme_tcc/screens/splash/splash_screen.dart';
import 'package:standbyme_tcc/theme.dart';
//import 'constants.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen()
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
