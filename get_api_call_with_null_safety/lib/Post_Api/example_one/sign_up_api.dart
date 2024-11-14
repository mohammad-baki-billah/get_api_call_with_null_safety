import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpApi extends StatefulWidget {
  const SignUpApi({super.key});

  @override
  State<SignUpApi> createState() => _SignUpApiState();
}

class _SignUpApiState extends State<SignUpApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  login(emailController.text, passwordController.text);
                });
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
