import 'package:flutter/material.dart';
//import 'package:standbyme_tcc/components/default_button.dart';
//import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/screens/complete_profile/components/complete_profile_form.dart';

//import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Complete seu perfil",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(26),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5),
              ),
              Text(
                "Complete com seus detalhes ou continue \ncom suas redes sociais",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.035,
              ),
              CompleteProfileForm()
            ],
          ),
        ),
      ),
    );
  }
}
