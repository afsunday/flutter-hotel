import 'package:flutter/material.dart';
import 'package:ls_app/screens/bottom_bar.dart';
import 'package:ls_app/screens/landing_screen.dart';
import 'package:ls_app/screens/login_screen.dart';
import 'package:ls_app/screens/register_screen.dart';
import 'package:ls_app/utils/app_styles.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) => MaterialApp.router(
  //       routeInformationProvider: _router.routeInformationProvider,
  //       routeInformationParser: _router.routeInformationParser,
  //       routerDelegate: _router.routerDelegate,
  //       title: 'Logicapp',
  //       debugShowCheckedModeBanner: false,
  //       theme: ThemeData(
  //         primaryColor: primary,
  //       ),
  //     );

  // final GoRouter _router = GoRouter(
  //   routes: <GoRoute>[
  //     GoRoute(
  //       path: '/',
  //       builder: (BuildContext context, GoRouterState state) =>
  //           const LandingScreen(),
  //     ),
  //     GoRoute(
  //       path: '/login',
  //       builder: (BuildContext context, GoRouterState state) =>
  //           const LoginScreen(),
  //     ),
  //     GoRoute(
  //       path: '/home',
  //       builder: (BuildContext context, GoRouterState state) =>
  //           const BottomBar(),
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Logicapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const BottomBar(),
      }
    );
  }
}
