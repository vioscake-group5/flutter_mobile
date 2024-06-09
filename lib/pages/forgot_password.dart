import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vioscake_admin/core/app_export.dart';
import 'package:vioscake_admin/pages/login_page.dart';
import 'package:vioscake_admin/theme/custom_button_style.dart';
import 'package:vioscake_admin/widgets/custom_elevated_button.dart';
import 'package:vioscake_admin/widgets/custom_pin_code_text_field.dart';

import 'package:http/http.dart' as http;

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {

    TextEditingController txtEmail = TextEditingController();

    Future<void> changePassword(BuildContext context, String email) async {
      final url = Uri.parse('https://vioscake.my.id/api/forgot-password');
      final headers = {
        'Content-Type' : 'application/json',
        // 'User' : 'Mobile'
      };
      final body = jsonEncode({
        'email' : email,
      });
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Email not found'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
    
    return SafeArea(
      child: Scaffold(
        // backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(25.h),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 38.v,
                width: 21.h,
                alignment: Alignment.centerLeft,
                onTap: () {
                  onTapImgArrowleftone(context);
                },
              ),
              SizedBox(height: 26.v),
              Text(
                "Verification Code",
                style: CustomTextStyles.displaySmallOnPrimaryContainer,
              ),
              SizedBox(height: 15.v),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10.v),
              // Text(
              //   "Please enter the code we just send to email",
              //   style: CustomTextStyles.bodySmallRegular,
              // ),
              // SizedBox(height: 13.v),
              // Text(
              //   "xxxxx@gmail.com",
              //   style: CustomTextStyles.bodySmallOnPrimaryContainerRegular,
              // ),
              // SizedBox(height: 38.v),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 49.h,
              //     right: 51.h,
              //   ),
              //   child: CustomPinCodeTextField(
              //     context: context,
              //     onChanged: (value) {},
              //   ),
              // ),
              // SizedBox(height: 40.v),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: "If you didn’t receive the code? ",
              //         style: CustomTextStyles.bodySmallOnPrimaryContainerRegular_1,
              //       ),
              //       TextSpan(
              //         text: "Resend",
              //         style: CustomTextStyles.labelLargeGray7000112.copyWith(
              //           decoration: TextDecoration.underline,
              //         ),
              //       )
              //     ],
              //   ),
              //   textAlign: TextAlign.left,
              // ),
              SizedBox(height: 48.v),
              CustomElevatedButton(
                text: "Continue",
                margin: EdgeInsets.only(
                  left: 42.h,
                  right: 41.h,
                ),
                buttonStyle: CustomButtonStyles.fillGray,
                buttonTextStyle: theme.textTheme.titleLarge!,
                onPressed: () {
                  // onTapContinue(context);
                  changePassword(context, txtEmail.text,);
                },
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the changePasswordScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
  }
}
