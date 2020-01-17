import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:koop/screens/sign_up_screen.dart';
import 'package:koop/utils/constants.dart';

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class LoginScreen extends StatelessWidget {
  static final String title = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            //TODO: Add Image here
                            width: 50.0,
                            height: 50.0,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: kSizedBoxSize,
                        ),
                        Text('Koop',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .color,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                    SizedBox(height: kSizedBoxSize),
                    LoginForm(),
                    SizedBox(height: kSizedBoxSize),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 2.0,
                        )),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('OU'),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 2.0,
                        )),
                      ],
                    ),
                    SizedBox(height: kSizedBoxSize),
                    FacebookSignInButton(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Pas de compte?'),
                    FlatButton(
                      padding: EdgeInsets.all(5.0),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.title);
                      },
                      child: Text(
                        'Créer un compte',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                'Mot de passe oublié?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: () {
                //TODO: Handle forgot password here on click
              },
            ),
          ),
          ButtonTheme(
            buttonColor: Theme.of(context).accentColor,
            minWidth: double.infinity,
            child: RaisedButton(
              child: Text(
                'Se connecter',
                style: kButtonTextStyle,
              ),
              onPressed: () {
                if (_formKey.currentState.saveAndValidate()) {
                  // _formKey.currentState.value store email and password
                  //TODO: Handle Auth request here on click
                  _formKey.currentState.reset();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FacebookSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // TODO add fb auth
      },
      color: Color(0xFF4267B2),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/f_logo.png',
            height: 24.0,
            width: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 10.0),
            child: Text(
              'Se connecter avec Facebook',
              style: kButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
