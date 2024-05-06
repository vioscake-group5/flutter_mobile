import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vioscake_admin/shared/shared.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Tambahkan AppBar di sini
          title: Text('Forgot Password Demo'),
        ),
        body: ForgotPassword(),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                onSaved: (pin1) {},
                decoration: InputDecoration(
                  hintText: "-",
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Membuat tepi bulat
                  ),
                ),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onSaved: (pin2) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  hintText: "-",
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Membuat tepi bulat
                  ),
                ),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onSaved: (pin3) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  hintText: "-",
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Membuat tepi bulat
                  ),
                ),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                onSaved: (pin4) {},
                onChanged: (value) {
                  if (value.length == 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                decoration: InputDecoration(
                  hintText: "-",
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Membuat tepi bulat
                  ),
                ),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
