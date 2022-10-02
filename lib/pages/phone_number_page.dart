import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:finsor/components/textFieldWithOnlyHintText.dart';
import 'package:finsor/pages/firebase_methods.dart';
import 'package:finsor/pages/otp_page.dart';
import 'package:finsor/theme/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Let's get started",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: backgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 160,
                        width: 160,
                        child: Lottie.asset(
                            "assets/animations/otp_animation.json")),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                      child: Text(
                        "You will receive a 6 digit code to verify next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 45,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Enter your phone number",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            InternationalPhoneNumberInput(
                                inputBorder: InputBorder.none,
                                keyboardAction: TextInputAction.next,
                                autoFocus: true,
                                scrollPadding: EdgeInsets.all(8),
                                selectorConfig: SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                    leadingPadding: 0,
                                    showFlags: false,
                                    trailingSpace: false),
                                spaceBetweenSelectorAndTextField: 1,
                                hintText: "1234567890",
                                autoValidateMode: AutovalidateMode.disabled,
                                ignoreBlank: false,
                                onInputChanged: (value) {
                                  phoneNumber = value.toString();
                                })
                            // TextFieldWithOnlyHintText(hintText: "+911234567890")
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            OTPPage.phoneNumber = phoneNumber;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.indigo[500],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
