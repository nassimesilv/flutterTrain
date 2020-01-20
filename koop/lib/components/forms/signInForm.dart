
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:koop/screens/home_screen.dart';
import 'package:koop/utils/constants.dart';

const String forgottenPasswordText = 'Mot de passe oubliÃ©?';
const String signInText = 'Se connecter';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            autovalidate: false,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: 'email',
                  decoration: InputDecoration(labelText: 'Email'),
                  maxLines: 1,
                  validators: [
                    FormBuilderValidators.email(
                        errorText: 'Veuillez entrer une adresse email valide'),
                    FormBuilderValidators.required(
                        errorText: 'Veuillez taper une addresse email'),
                  ],
                ),
                FormBuilderTextField(
                  // TODO: set password hiden obscureText: true,
                  attribute: 'password',
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                  maxLines: 1,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Veuillez entrer un mot de passe'),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                forgottenPasswordText,
                style: kUnderlineText,
              ),
              onPressed: () {
                //TODO: Handle forgot password here on click
              },
            ),
          ),
          SimpleButton(
            label: signInText,
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                // _formKey.currentState.value store email and password
                //TODO: Handle Auth request here on click
                // _formKey.currentState.reset();
              }
              Navigator.pushReplacementNamed(context, HomeScreen.title);
            },
          ),
        ],
      ),
    );
  }
}