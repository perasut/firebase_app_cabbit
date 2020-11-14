import 'package:firebase_app_cabbit/res/style.dart';
import 'package:firebase_app_cabbit/service/firebase/firebase_auth_service.dart';
import 'package:firebase_app_cabbit/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneLoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber;
  String _smsOTP;
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เข้าสู่ระบบด้วยเบอร์โทรศัพท์',
          style: GoogleFonts.kanit(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '+66 ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: styleInputDecoration.copyWith(
                                labelText: 'Phone Number'),
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            style: styleTextFieldText,
                            onChanged: (value) => _phoneNumber = value,
                            validator: (value) => value.trim().isEmpty
                                ? 'Enter Phone Number'
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: ButtonWidget(
                              buttonText: 'Send',
                              onClick: () {
                                // if(_formKey.currentState.validate()){

                                // }
                                FirebaseAuthService.requestVerifyCode(
                                    _phoneNumber, _verificationId);
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: styleInputDecoration.copyWith(
                          labelText: 'SMS Verify'),
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      maxLength: 6,
                      style: styleTextFieldText,
                      onChanged: (value) => _smsOTP = value,
                      validator: (value) =>
                          value.trim().isEmpty ? 'Enter SMS Verify' : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonWidget(
                        buttonText: 'เข้าสู่ระบบ',
                        onClick: () {
                          if (_formKey.currentState.validate()) {}
                        }),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
