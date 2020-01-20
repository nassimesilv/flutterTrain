import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:koop/screens/cgu_screen.dart';
import 'package:koop/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
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
                FormBuilderRadio(
                  decoration: InputDecoration(labelText: 'Je suis un'),
                  attribute: 'Usertype',
                  leadingInput: true,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Veuillez selectionner un type'),
                  ],
                  options: ['Barber', 'Client']
                      .map(
                          (userType) => FormBuilderFieldOption(value: userType))
                      .toList(growable: false),
                ),
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
                  attribute: 'Mot de passe',
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                  maxLines: 1,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Veuillez entrer un mot de passe'),
                  ],
                ),
                FormBuilderTextField(
                  attribute: 'Confirmer mot de passe',
                  decoration: InputDecoration(
                    labelText: 'Confirmer mot de passe',
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
          SizedBox(
            height: kSizedBoxSize,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      'En cliquant sur se connecter je mÃ©ngage a accepter les ',
                ),
                TextSpan(
                  text: 'CGU',
                  style: TextStyle(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, CGUScreen.title);
                    },
                ),
              ],
            ),
          ),
          SizedBox(
            height: kSizedBoxSize,
          ),
          SimpleButton(
            label: 'CrÃ©er un compte',
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                // _formKey.currentState.value store email and password
                //TODO: Handle Signing up request
                _formKey.currentState.reset();
              }
            },
          )
        ],
      ),
    );
  }
}

