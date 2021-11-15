import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/cartoes/components/body.dart';
import 'package:standbyme_tcc/screens/contas/components/body.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartoesScreen extends StatelessWidget {
  static String routeName = "/cartoes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation(kPrimaryColor),
                )),
          );

        return BodyCartoes(snapshot.data);
      },
      future: getId(),
    ));
  }

  Future<int> getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("id");
  }
}
