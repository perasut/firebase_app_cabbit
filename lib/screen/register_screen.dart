import 'package:firebase_app_cabbit/res/style.dart';
import 'package:firebase_app_cabbit/route/routes.dart';
import 'package:firebase_app_cabbit/widget/button_widget.dart';
import 'package:firebase_app_cabbit/service/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                    height: 20,
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
                    height: 10,
                  ),
                  TextFormField(
                    decoration: styleInputDecoration.copyWith(
                        labelText: 'Confirm Password'),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    maxLines: 1,
                    style: styleTextFieldText,
                    onChanged: (value) => _confirmPassword = value,
                    validator: (value) =>
                        value.trim().isEmpty || value.trim() != _password.trim()
                            ? 'Password mismatch'
                            : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                      buttonText: 'REGISTER',
                      onClick: () {
                        print(_email);
                        if (_formKey.currentState.validate()) {
                          FirebaseAuthService.firebaseRegister(
                              _email, _password);
                          Navigator.pushReplacementNamed(context, routeLogin);
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: RichText(
                      text: TextSpan(
                        text: "If your have an account?",
                        style: styleSmallText,
                        children: [
                          TextSpan(
                            text: ' Back to login page.',
                            style: styleSmallText.copyWith(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, routeLogin);
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
