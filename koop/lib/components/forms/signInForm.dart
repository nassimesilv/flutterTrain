
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:koop/screens/forgot_password_screens.dart';
import 'package:koop/screens/home_screen.dart';
import 'package:koop/services/auth.service.dart';
import 'package:koop/utils/constants.dart';
import 'package:provider/provider.dart';

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
                  obscureText: true,
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
                Navigator.pushNamed(context, ForgotPasswordEmailScreen.title);
                EasyLoading.show();
                // Navigate to forgoty password screen
              },
            ),
          ),
          SimpleButton(
            label: signInText,
            onPressed: () async {
              if (_formKey.currentState.saveAndValidate()) {
                // _formKey.currentState.value store email and password
                //TODO: Handle Auth request here on click
                // var result = await Provider.of<AuthService>(context).signIn(email: _formKey.currentState.value['email'], password: _formKey.currentState.value['password']);
                // if (result == null) show snackbar 
                // else pushReplacement
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