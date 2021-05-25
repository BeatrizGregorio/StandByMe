import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/screens/sign_up/components/sign_up_form.dart';
import 'package:standbyme_tcc/size_config.dart';

import '../../../constants.dart';
import 'package:standbyme_tcc/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Cadastre-se",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5),
          ),
          Text(
            "Complete com seus dados ou continue \ncom as redes socias",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          SignUpForm(),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
        ],
      ),
    );
  }
}
