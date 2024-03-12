import 'package:go_router/go_router.dart';
import 'package:password5_54/screens/AccountScreen.dart';
import 'package:password5_54/screens/HomeScreen.dart';
import 'package:password5_54/screens/LoginScreen.dart';
import 'package:password5_54/screens/Password_screen.dart';

import '../screens/KeyScreen.dart';
import '../screens/SignUpScreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signIn',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/password',
      builder: (context, state) => const PasswordScreen(),
    ),
    GoRoute(
      path: '/key',
      builder: (context, state) => const KeyScreen(),
    ),
  ],
);