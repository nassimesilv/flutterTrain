import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:koop/screens/login_screen.dart';
import 'package:koop/services/auth.service.dart';
import 'package:provider/provider.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  static final String title = 'forgot_password_email_screen';

  @override
  _ForgotPasswordEmailScreenState createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final GlobalKey<FormBuilderState> _forgotPasswordEmailKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mot de passe oublie'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                  'Veuillez entrer une adresse mail, un code de confirmation vous y sera envoye'),
              Container(
                child: FormBuilder(
                  key: this._forgotPasswordEmailKey,
                  child: FormBuilderTextField(
                    attribute: 'email',
                    decoration: InputDecoration(labelText: 'Email'),
                    maxLines: 1,
                    validators: [
                      FormBuilderValidators.email(
                          errorText:
                              'Veuillez entrer une adresse email valide'),
                      FormBuilderValidators.required(
                          errorText: 'Veuillez taper une addresse email'),
                    ],
                  ),
                ),
              ),
              SimpleButton(
                label: 'Envoyer le code',
                onPressed: () async {
                  //TODO: Handle forgot password send email
                  // if (this._forgotPasswordEmailKey.currentState.saveAndValidate()) {
                  //   var result = await Provider.of<AuthService>(context).sendForgotPasswordEMail(email: this._forgotPasswordEmailKey.currentState.value['email']);
                  //   if (result == true) {
                  //     Navigator.pushReplacementNamed(context, ForgotPasswordCodeScreen.title);
                  //   } else {
                  //     TODO Show snackbar error
                  //   }
                  // }
                  Navigator.pushNamed(context, ForgotPasswordCodeScreen.title);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordCodeScreen extends StatefulWidget {
  static final String title = 'forgot_password_code_screen';

  @override
  _ForgotPasswordCodeScreenState createState() =>
      _ForgotPasswordCodeScreenState();
}

class _ForgotPasswordCodeScreenState extends State<ForgotPasswordCodeScreen> {
  final GlobalKey<FormBuilderState> _forgotPasswordCodeKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mot de passe oublie'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Veuillez entrer le code de confirmation recu par mail'),
              Container(
                child: FormBuilder(
                  key: this._forgotPasswordCodeKey,
                  child: FormBuilderTextField(
                    attribute: 'code',
                    decoration: InputDecoration(labelText: 'Code'),
                    maxLines: 1,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Veuillez entrer le code de confirmation'),
                    ],
                  ),
                ),
              ),
              SimpleButton(
                label: 'Valider',
                onPressed: () async {
                  // TODO: Handle forgot password send email
                  // if (this._forgotPasswordCodeKey.currentState.saveAndValidate()) {
                  //   var result = await Provider.of<AuthService>(context).checkForgotPasswordCode(code: this._forgotPasswordCodeKey.currentState.value['code']);
                  //   if (result == true) {
                  //     Navigator.pushReplacementNamed(context, 'routeName');
                  //   } else {
                  //     TODO Show snackbar error
                  //   }
                  // }
                  Navigator.pushReplacementNamed(context, ForgotPasswordScreen.title,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  static final String title = 'forgot_password_screen';
  final String code = 'hello';


  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormBuilderState> _forgotPasswordKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mot de passe oublie'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Veuillez entrer votre nouveau mot de passe'),
              Container(
                child: FormBuilder(
                  key: this._forgotPasswordKey,
                  autovalidate: false,
                  child: Column(
                    children: <Widget>[
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
              ),
              SimpleButton(
                label: 'Valider',
                onPressed: () async {
                  // TODO: Handle forgot password send email
                  // if (this._forgotPasswordKey.currentState.saveAndValidate()) {
                  //   var result = await Provider.of<AuthService>(context)
                  //       .changePassword(
                  //           code: widget.code);
                  //   if (result == true) {
                  //     Navigator.pushReplacementNamed(context, LoginScreen.title);
                  //   } else {
                  //     // TODO Show snackbar error
                  //   }
                  // }
                  Navigator.pushReplacementNamed(context, LoginScreen.title);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
