import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vioscake_admin/pages/forgot_password.dart';
import 'package:vioscake_admin/pages/landing_page.dart';
import 'package:vioscake_admin/pages/register_page.dart';
import 'package:vioscake_admin/shared/shared.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // text controller
    TextEditingController txtEmail = TextEditingController();
    TextEditingController txtPassword = TextEditingController();

    // make login
    Future<void> login(BuildContext context, String email, String password) async {
      final url = Uri.parse('https://vioscake.my.id/api/login');
      final headers = {
        'Content-Type' : 'application/json',
        'User' : 'Mobile'
      };
      final body = jsonEncode({
        'email' : email,
        'password' : password
      });
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        // Save token to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        // Tampilkan token pada log
        // print('Token berhasil disimpan: $token');
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LandingPage()),
        );
      } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to login. Please try again.'),
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

    return Scaffold(
      backgroundColor: Color(0xFFEFD7AE),
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: Color(0xFFEFD7AE),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: null,
            child: Container(
              height: 580, // Setengah tinggi layar
              color: Colors.white, // Warna latar belakang
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Sign in to Your Acccount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    'Welcome Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFDEAE78),
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ), // Atur padding sesuai kebutuhan Anda
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
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: TextField(
                    controller: txtPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Tambahkan navigasi ke halaman ForgotPassword di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: thirdColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    // this._doLogin();
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LandingPage()),
                      // );
                      login(context, txtEmail.text, txtPassword.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Color(0xFF6B5048),
                      ),
                      minimumSize: WidgetStateProperty.all<Size>(
                        Size(251, 51),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: whiteTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: TextButton(
                    onPressed: () {
                      // navigate ke halaman ForgotPassword di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'Don`t have an account? Sign up',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: thirdColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
