import 'package:firebase_app_cabbit/res/style.dart';
import 'package:firebase_app_cabbit/service/firebase/firebase_auth_service.dart';
import 'package:firebase_app_cabbit/widget/bottom_sheet_widget.dart';
import 'package:firebase_app_cabbit/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:international_phone_input/international_phone_input.dart';

class PhoneLoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  String _phoneNumber;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
      _phoneNumber = internationalizedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบด้วยเบอร์โทรศัพท์', style: GoogleFonts.kanit(),),
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
                 SizedBox(height: 20.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Expanded(
                       flex: 1,
                       child: InternationalPhoneInput(
                            // decoration: buildSignUpInputDecoration("Enter Phone Number"),
                            onPhoneNumberChange:onPhoneNumberChange,
                            decoration: InputDecoration.collapsed(hintText: 'ป้อนเบอร์โทรศัพท์'),
                            labelStyle: styleTextFieldPhone,
                            initialPhoneNumber: _phoneNumber,
                            initialSelection: 'TH',
                            showCountryCodes: true),
                      ),
                    SizedBox(width: 20.0,),
                  ],
                 ),
                  SizedBox(height: 20.0,),
                  ButtonWidget(
                    buttonText: 'ส่งข้อมูล', 
                    onClick: () {
                      if(_formKey.currentState.validate()){
                        if(_phoneNumber == "" || _phoneNumber == null){
                          BottomSheetWidget().bottomSheet(context, "มีข้อผิดพลาด", "รูปแบบเบอร์โทรศัพท์ไม่ถูกต้อง");
                        }else{
                           print(_phoneNumber);
                          var result = FirebaseAuthService().createUserWithPhone(_phoneNumber, context);
                          if(result == "error"){
                            Fluttertoast.showToast(
                              msg: 'Your phone number could not be validated',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                            );
                          }
                        }
                      }
                    }
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}