import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';
import 'package:standbyme_tcc/models/Usuario.dart';
//import 'package:standbyme_tcc/modules/http.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telController = TextEditingController();
  String response = "";
  bool passwordFocus = false;
  bool emailFocus = false;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;

  String firstName;
  String lastName;
  String info;
  String phone;
  bool showPassword = false;
  bool firstNameFocus = false;
  bool lastNameFocus = false;
  bool infoFocus = false;
  bool phoneFocus = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future<Usuario> createUser() async {
    Usuario novoUsuario = new Usuario(
        primeiroNome: nameController.text,
        sobrenome: lastNameController.text,
        telefone: telController.text,
        email: emailController.text,
        senha: passwordController.text);

    return new UsuarioController().cadastrarUsuario(novoUsuario);
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Já existe uma conta com este email!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              buildFirstNameFormField(),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              buildLastNameFormField(),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              buildPhoneFormField(),
              FormError(errors: errors),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              buildEmailFormField(),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              buildPassFormField(),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              buildConfirmPassField(),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              DefaultButton(
                text: "Cadastrar",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    try {
                      Usuario usuario = await createUser();
                      log(usuario.primeiroNome);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    } on Exception catch (err) {
                      log(err.toString());
                      _showToast(context);
                    }
                    /*
                    FutureBuilder(
                        future: createUser(),
                        builder: (context, snapshot) {
                          bool isSuccessful = snapshot.data;
                          log(snapshot.data);
                          if (isSuccessful) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                            return;
                          } else {
                            _showToast(context);
                            return;
                          }
                        }); */
                    //_showToast(context);
                  }
                },
              )
            ],
          ),
        ));
  }

  TextFormField buildConfirmPassField() {
    return TextFormField(
      onTap: () {
        setState(() {
          passwordFocus = true;
          emailFocus = false;
        });
      },
      onSaved: (newValue) => confirm_password = newValue,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kConfirmPassNullError)) {
          setState(() {
            errors.add(kConfirmPassNullError);
          });
          return "";
        } else if (password != value) {
          setState(() {
            errors.remove(kMatchPassError);
          });
          return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty &&
            errors.contains(kMatchPassError) &&
            errors.contains(kConfirmPassNullError)) {
          setState(() {
            errors.remove(kMatchPassError);
            errors.remove(kConfirmPassNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          labelText: "Confirme a senha",
          labelStyle:
              TextStyle(color: passwordFocus ? kPrimaryColor : Colors.grey),
          hintText: "Confirme sua senha",
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

  TextFormField buildPassFormField() {
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
        password = value;
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

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: telController,
      onTap: () {
        setState(() {
          phoneFocus = true;
          lastNameFocus = false;
          firstNameFocus = false;
          infoFocus = false;
        });
      },
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phone = newValue,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        labelStyle: TextStyle(color: phoneFocus ? kPrimaryColor : Colors.grey),
        labelText: "Telefone",
        hintText: "Digite seu telefone",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(15, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(
            Icons.phone_android_outlined,
            color: phoneFocus ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastNameController,
      onTap: () {
        setState(() {
          phoneFocus = false;
          lastNameFocus = true;
          firstNameFocus = false;
          infoFocus = false;
        });
      },
      onSaved: (newValue) => lastName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kLastNameNullError);
          return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNameNullError);
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        labelStyle:
            TextStyle(color: lastNameFocus ? kPrimaryColor : Colors.grey),
        labelText: "Sobrenome",
        hintText: "Digite seu sobrenome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(15, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(
            Icons.person_outline_rounded,
            color: lastNameFocus ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
        controller: nameController,
        onTap: () {
          setState(() {
            phoneFocus = false;
            lastNameFocus = false;
            firstNameFocus = true;
            infoFocus = false;
          });
        },
        onSaved: (newValue) => firstName = newValue,
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kNameNullError);
            return "";
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNameNullError);
          }
          return null;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          labelStyle:
              TextStyle(color: firstNameFocus ? kPrimaryColor : Colors.grey),
          labelText: "Nome",
          hintText: "Digite seu nome",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                15,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: Icon(
              Icons.person_outline_rounded,
              color: firstNameFocus ? kPrimaryColor : Colors.grey,
            ),
          ),
        ));
  }
}
