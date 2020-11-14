import 'package:firebase_app_cabbit/res/style.dart';
import 'package:firebase_app_cabbit/route/routes.dart';
import 'package:firebase_app_cabbit/widget/button_widget.dart';
import 'package:firebase_app_cabbit/service/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 80.0,
                    height: 80.0,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration:
                        styleInputDecoration.copyWith(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    style: styleTextFieldText,
                    onChanged: (value) => _email = value,
                    validator: (value) =>
                        value.trim().isEmpty ? 'Enter email address' : null,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration:
                        styleInputDecoration.copyWith(labelText: 'Password'),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    maxLines: 1,
                    style: styleTextFieldText,
                    onChanged: (value) => _password = value,
                    validator: (value) =>
                        value.trim().isEmpty ? 'Enter password' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                      buttonText: 'LOGIN',
                      onClick: () {
                        print(_email);
                        if (_formKey.currentState.validate()) {
                          FirebaseAuthService.firebaseSignIn(_email, _password);
                          // Navigator.
                          Navigator.pushReplacementNamed(context, routeHome);
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have account?",
                        style: styleSmallText,
                        children: [
                          TextSpan(
                            text: ' Create New Account.',
                            style: styleSmallText.copyWith(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, routeRegister);
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
