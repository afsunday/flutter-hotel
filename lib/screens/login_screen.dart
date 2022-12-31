import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ls_app/utils/app_layout.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = true;
  late SharedPreferences loginData;
  late bool newUser;
  var processing = false;

  @override
  void initState() {
    super.initState();
    checkHasAccount();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              children: [
                Container(
                  height: 250,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://ouch-cdn2.icons8.com/OQ3yuVTnKqAb4khnDpO7_KBTgYEZFOxQQSTIg3787mg/rs:fit:256:458/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvOTYz/L2Q3ZTAzZDAzLWIw/MGQtNDgyMi05OWQ1/LTMxMmVhMTJkNTY3/My5wbmc.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // login text heading
                const Gap(25),
                Text(
                  'Login',
                  style: Styles.headLineStyle2.copyWith(
                    fontSize: 40,
                    color: const Color(0xFF0A1A35),
                  ),
                ),

                // form input section
                const Gap(15),
                TextField(
                  controller: emailController,
                  autofocus: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    hintText: 'Email ID',
                    hintStyle: TextStyle(color: Color(0xFF666666)),
                  ),
                ),

                const Gap(15),
                TextField(
                  obscureText: showPassword,
                  controller: passwordController,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Color(0xFF666666)),
                    suffixIcon: InkWell(
                      onTap: setPasswordView,
                      child: showPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                ),

                // form submit button
                const Gap(25),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 16)),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: processing
                      ? null
                      : () {
                          login(context);
                        },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // password visibilty toggle
  void setPasswordView() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  // check if user is login
  void checkHasAccount() async {
    loginData = await SharedPreferences.getInstance();
    // dynamic hasAccount = loginData.getBool('hasAccount');
  }

  // http request to log user in
  Future login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    setState(() => processing = true);

    try {
      var url = Uri.parse('https://api.teddyship.com/api/v1/login');
      var response = await http.post(
        url,
        headers: {'accept': 'application/json'},
        body: {
          'userid': emailController.text.toString(),
          'password': passwordController.text.toString()
        },
      );

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        loginData.setBool('isLogged', true);
        loginData.setString('token', data['data']['token']);

        Navigator.pushNamed(context, '/home');
      }

      if (response.statusCode == 422) {
        _showSnackbar(context, data['message']);
      }

      setState(() => processing = false);
    } catch (e) {
      processing = false;
      _showSnackbar(context, 'Sorry error occured please retry.');
    }
  }

  void _showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 10),
      ),
    );
  }
}
