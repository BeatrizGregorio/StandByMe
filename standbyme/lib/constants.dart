import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(200, 153, 51, 153);
const kBackgroundColor = Color(0XFFD9E8DA);
const kPrimaryLightColor = Color.fromARGB(255, 182, 95, 207);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0XFFFFA53E), Color(0XFFFF7643)]);
const kSecondaryColor = Color(0XFF979797);
const kTextColor = Color(0XFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const String kEmailNullError = "Por favor, digite seu email";
const String kPasswordNullError = "Por favor, digite sua senha";
const String kInvalidError = "Email ou senha inválidos";
const String kMatchPassError = "As senhas não são iguais";
const String kConfirmPassNullError = "Por favor, confirme sua senha";
const String kNameNullError = "Por favor, digite seu nome";
const String kLastNameNullError = "Por favor, digite seu sobrenome";
const String kPhoneNullError = "Por favor, digite seu telefone";
const String kInfoNullError = "Por favor, digite suas informações";
