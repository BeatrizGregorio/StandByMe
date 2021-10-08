import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/screens/home/home_screen.dart';
//import 'package:standbyme_tcc/screens/login_success/login_sucess_screen.dart';
import 'dart:developer';
import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool passwordFocus = false;
  bool emailFocus = false;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<Usuario> login() async {
    log(emailController.text);
    log(passwordController.text);
    Usuario novoUsuario = new Usuario.empty();
    novoUsuario.email = emailController.text;
    novoUsuario.senha = passwordController.text;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    novoUsuario = await new UsuarioController().logarUsuario(novoUsuario);
    preferences.setInt("id", novoUsuario.id);

    return novoUsuario;
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Email ou senha incorretos!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(1),
          ),
          Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(
                "Lembre de mim",
                style: TextStyle(color: Colors.black),
              ),
              Spacer(),
              Text(
                "Esqueci minha senha",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(75),
          ),
          DefaultButton(
            text: "Continuar",
            press: () async {
              if (_formKey.currentState.validate()) {
                try {
                  Usuario usuario = await login();
                  log("teste");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } on Exception catch (err) {
                  //log(err.toString());
                  _showToast(context);
                }
              }
            },
          )
        ],
      ),
    );
  }

  bool showPassword = false;
  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      onTap: () {
        setState(() {
          passwordFocus = true;
          emailFocus = false;
        });
      },
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPasswordNullError)) {
          setState(() {
            errors.add(kPasswordNullError);
          });
          return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPasswordNullError)) {
          setState(() {
            errors.remove(kPasswordNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          labelText: "Senha",
          labelStyle:
              TextStyle(color: passwordFocus ? kPrimaryColor : Colors.grey),
          hintText: "Digite sua senha",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                15,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: Icon(
              Icons.lock_outlined,
              color: passwordFocus ? kPrimaryColor : Colors.grey,
            ),
          ),
          suffixIcon: GestureDetector(
            child: Icon(
                showPassword == false ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey),
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
          hintStyle: TextStyle(color: kTextColor)),
      obscureText: showPassword == false ? true : false,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      onTap: () {
        setState(() {
          emailFocus = true;
          passwordFocus = false;
        });
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        labelStyle: TextStyle(color: emailFocus ? kPrimaryColor : Colors.grey),
        labelText: "Email",
        hintText: "Digite seu email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(15, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(
            Icons.mail_outline_outlined,
            color: emailFocus ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
