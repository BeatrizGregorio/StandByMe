import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/components/socal_card.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/sign_in/components/sign_form.dart';
import 'package:standbyme_tcc/screens/sign_up/sign_up_screen.dart';
import 'package:standbyme_tcc/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  "Bem-vindo",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  "Faça login com seu email e senha  \nou continue com uma rede social",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google_logo.png",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook_logo.png",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Não possui uma conta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.popAndPushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Cadastre-se",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
