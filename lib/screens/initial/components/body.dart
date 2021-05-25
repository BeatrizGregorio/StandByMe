import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/screens/sign_up/sign_up_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            SizedBox(
              height: getProportionateScreenHeight(265),
              child: Image.asset(
                "assets/images/logo_preta.PNG",
              ),
            ),
            Spacer(),
            SizedBox(
              width: getProportionateScreenWidth(250),
              height: getProportionateScreenHeight(55),
              /*child: Container(
                decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500],
                      blurRadius: 4.0,
                      offset: Offset(0, 8))
                ]),*/
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: kPrimaryLightColor,
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                child: Text("Login",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white)),
              ),
              // ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            SizedBox(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(50),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.grey[200],
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: Text("Cadastrar-se",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: kPrimaryLightColor)),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(70),
            )
          ],
        ),
      ),
    );
  }
}
