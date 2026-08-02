import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppRoutes {
  static const splash = "/";
  static const login = "/login";
  static const register = "/register";
  static const forgotPassword = "/forgot-password";
  static const home = "/home";
  static const chat = "/chat";
  static const profile = "/profile";
  static const settings = "/settings";

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        login: (_) => const LoginScreen(),
        register: (_) => const RegisterScreen(),
        forgotPassword: (_) => const ForgotPasswordScreen(),
        home: (_) => const HomeScreen(),
        chat: (_) => const ChatScreen(),
        profile: (_) => const ProfileScreen(),
        settings: (_) => const SettingsScreen(),
      };
}
