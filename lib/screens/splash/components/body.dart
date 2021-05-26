import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/initial/inital_screen.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/size_config.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bem-vindo ao Stand By Me!",
      "image": "assets/images/logo_preta.PNG"
    },
    {
      "text": "Nós ajudamos pessoas na sua nova fase \nao morar sozinha.",
      "image": ""
    },
    {
      "text": "Eu sou a Tina e te ajudarei na parte doméstica!",
      "image": "assets/images/tina.PNG"
    },
    {
      "text": "Eu sou o Otto e te ajudarei \nna cozinha!",
      "image": "assets/images/otto.PNG"
    },
    {
      "text": "Eu sou a Luna e te ajudarei \nna parte financeira!",
      "image": "assets/images/luna.PNG"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"],
                        text: splashData[index]["text"],
                      )),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      DefaultButton(
                        text: "Continuar",
                        press: () {
                          Navigator.pushNamed(context, InitialScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0XFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
