import 'dart:convert';
import 'package:eclaims2/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eclaims2/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'connection/connection.dart';
import 'tools/input.dart';
// import 'home.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  validation() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Name and email cannot be empty.');
      return;
    }
    print(phoneController.text.trim());
    print('Sending API request...');
    User usermodel = User(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      print('connecting..');
      var res = await http.post(
        Uri.parse(API.signup),
        body: jsonEncode(usermodel.toJson()),
      );
      print(res.statusCode.toString());
      if (res.statusCode == 200) {
        var resofsignup = jsonDecode(res.body);
        print('API response: $resofsignup');
        if (resofsignup['success'] != null && resofsignup['success']) {
          Fluttertoast.showToast(msg: 'Successfully registered');
          print('success');
        } else {
          Fluttertoast.showToast(msg: 'Error occurred. Try again.');
        }
      } else {
        print('query not executed');
      }
    } catch (e) {
      print('error');
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 1,
                ),
                const Text('Welcome To', style: TextStyle(fontSize: 20)),
                const Text(
                  'e-claims',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                    padding: const EdgeInsets.only(top: 60),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Input(
                              hintText: 'Enter your Full Name',
                              showSuffixIcon: false,
                              controller: nameController,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 30),
                            Input(
                              hintText: 'Enter your Email',
                              showSuffixIcon: false,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Input(
                              hintText: 'Enter your Phone Number',
                              showSuffixIcon: false,
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Input(
                              hintText: 'Enter your Password',
                              showSuffixIcon: true,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    validation();
                                  }
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
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already a member ? ',
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
                                            builder: (context) => Login(),
                                          ),
                                        );
                                        print('Link clicked');
                                      },
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'Log In',
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
                            ),
                          ],
                        ))),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
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
      ),
    );
  }
}
