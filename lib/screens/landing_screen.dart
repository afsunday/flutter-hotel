import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_styles.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late SharedPreferences loginData;

  @override
  void initState() {
    super.initState();
    checkAuthState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              children: <Widget>[
                const Text(
                    'This is the landing screen if we dont know if you have and account or not'),
                const Gap(30),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: Text('Register', style: Styles.headLineStyle2),
                    ),
                    const Gap(15),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: Text('Login', style: Styles.headLineStyle2),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // check user registration and login state
  void checkAuthState() async {
    loginData = await SharedPreferences.getInstance();
    bool? hasAccount = loginData.getBool('hasAccount');
    bool? isLoggedIn = loginData.getBool('isLogged');

    // if (isLoggedIn == true) {
    //   context.go('/home');
    // }

    // if (hasAccount == true && isLoggedIn == false) {
    //   context.go('/home');
    // }
  }
}
