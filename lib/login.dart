import 'dart:convert';
import 'package:eclaims2/authentification.dart';

import 'tools/input.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'model/user.dart';
import 'connection/connection.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  validation() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => home(),
        ));

    // if (passwordController.text.isEmpty || emailController.text.isEmpty) {
    //   Fluttertoast.showToast(msg: 'Name and email cannot be empty.');
    //   return;
    // }
    // print('Sending API request...');

    // try {
    //   print('connecting..');
    //   var res = await http.post(
    //     Uri.parse(API.login),
    //     body: {
    //       "email": emailController.text.trim(),
    //       "password": passwordController.text.trim(),
    //     },
    //   );
    //   print('hh');
    //   print(res.statusCode.toString());
    //   if (res.statusCode == 200) {
    //     var resBodyOfLogin = jsonDecode(res.body);
    //     print('API response: $resBodyOfLogin');
    //     if (resBodyOfLogin['success'] != null && resBodyOfLogin['success']) {
    //       Fluttertoast.showToast(msg: 'Successfully Logged in');
    //       // User userInfo = User.fromJson(resBodyOfLogin["userData"]);
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => home(),
    //           ));
    //     } else {
    //       Fluttertoast.showToast(msg: 'Error occurred. Try again.');
    //     }
    //   } else {
    //     print('query not executed');
    //   }
    // } catch (e) {
    //   print('error');
    //   print(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text('Welcome To', style: TextStyle(fontSize: 20)),
                  const Text(
                    'e-claims',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Input(
                              hintText: "enter your email",
                              showSuffixIcon: false,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Input(
                              hintText: "enter your password",
                              showSuffixIcon: true,
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                // if (formKey.currentState!.validate()) {
                                validation();
                                // }
                              },
                              child: Text('Continue',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFfbbc05),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Not a member ? ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Authentification(),
                                    ),
                                  );
                                  print('Link clicked');
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      color: Color(0xFFfbbc05),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              )),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/ward.png',
              fit: BoxFit.cover,
            ),
          ),
          
        ],
      ),
    );
  }
}
