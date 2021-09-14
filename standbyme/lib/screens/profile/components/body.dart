import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/screens/list/components/body.dart';
//import 'package:standbyme_tcc/screens/profile/profile_screen.dart';

import 'package:standbyme_tcc/size_config.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          title: Image.asset(
            "assets/images/logo_porta.PNG",
            height: SizeConfig.screenHeight * 0.08,
          ),
          backgroundColor: kPrimaryColor.withOpacity(0.7),
          centerTitle: true,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black.withOpacity(0.5),
                    size: 30,
                  ),
                  onPressed: () {},
                ))
          ]),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: kPrimaryColor.withOpacity(0.2))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.squarespace-cdn.com/content/v1/565283a3e4b06ed63ea5f928/1573329464437-AYNV09QNC9AJ8LEJYKUF/blank-profile-picture-973460_1280.jpg?format=1000w'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(200, 153, 51, 153),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              buildTextField("Nome Completo", "Fulaninho", false),
              buildTextField("Email", "fulaninho@email.com", false),
              buildTextField("Senha", "senhaDoFulaninho", false),
              buildTextField("Informações", "Informações do fulaninho", false),
              buildTextField("Telefone", "99191888171", false),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor.withOpacity(0.6),
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor.withOpacity(0.6),
                        padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(width: 0)
                ],
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? true : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye,
                      color: Color.fromARGB(200, 153, 51, 153)),
                  onPressed: () {},
                )
              : null,
          contentPadding: EdgeInsets.fromLTRB(
              getProportionateScreenHeight(40),
              getProportionateScreenHeight(20),
              getProportionateScreenHeight(20),
              getProportionateScreenHeight(20)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color.fromARGB(200, 153, 51, 153)),
            gapPadding: 10,
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: Colors.grey),
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(200, 153, 51, 153).withOpacity(0.5)),
        ),
      ),
    );
  }
}
