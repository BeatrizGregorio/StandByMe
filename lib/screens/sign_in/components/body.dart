import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/sign_in/components/sign_form.dart';
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
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Text(
                  "Bem-vindo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Faça login com seu email e senha  \nou continue com uma rede social",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não possui uma conta? ",
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                    Text(
                      "Cadastre-se",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kPrimaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0XFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          icon,
        ),
      ),
    );
  }
}
