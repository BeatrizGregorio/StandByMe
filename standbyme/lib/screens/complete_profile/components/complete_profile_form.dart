import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/components/form_error.dart';
import 'package:standbyme_tcc/modules/http.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/screens/sign_up/sign_up_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String info;
  String phone;
  bool firstNameFocus = false;
  bool lastNameFocus = false;
  bool infoFocus = false;
  bool phoneFocus = false;

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(18),
          ),
          buildLastNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(18),
          ),
          buildInfoFormField(),
          SizedBox(
            height: getProportionateScreenHeight(18),
          ),
          buildPhoneFormField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          DefaultButton(
            text: "Continuar",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
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
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(
            Icons.phone_android_outlined,
            color: phoneFocus ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildInfoFormField() {
    return TextFormField(
      onTap: () {
        setState(() {
          phoneFocus = false;
          lastNameFocus = false;
          firstNameFocus = false;
          infoFocus = true;
        });
      },
      onSaved: (newValue) => info = newValue,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInfoNullError);
          return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kInfoNullError);
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        labelStyle: TextStyle(color: infoFocus ? kPrimaryColor : Colors.grey),
        labelText: "Info",
        hintText: "Digite suas informações",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(
            Icons.info_outline,
            color: infoFocus ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
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
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
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
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(
            Icons.person_outline_rounded,
            color: firstNameFocus ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
