import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/src/pages/settings/settings_page.dart';
import 'package:notesapp/src/routing/route_names.dart';
import 'package:notesapp/src/pages/editNote/edit_note_page.dart';
import 'package:notesapp/src/pages/emailVerification/email_verification_page.dart';
import 'package:notesapp/src/pages/forgotPassword/frogot_password.dart';
import 'package:notesapp/src/pages/home/home_page.dart';
import 'package:notesapp/src/pages/login/login_page.dart';
import 'package:notesapp/src/pages/register/register_page.dart';
import 'package:notesapp/src/pages/splash/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashRoute:
      return _getPageRoute(SplashPage(), settings);
    case homeRoute:
      return _getPageRoute(HomePage(), settings);
    case loginRoute:
      return _getPageRoute(LoginPage(), settings);
    case registerRoute:
      return _getPageRoute(RegisterPage(), settings);
    case forgotPasswordRoute:
      return _getPageRoute(ForgotPasswordPage(), settings);
    case emailVerificationRoute:
      return _getPageRoute(EmailVerificationPage(), settings);
    case addNoteRoute:
      return _getPageRoute(EditNotePage(), settings);
    case editNoteRoute:
      return _getPageRoute(EditNotePage(), settings);
    case settingsRoute:
      return _getPageRoute(SettingsPage(), settings);
    default:
      return _getPageRoute(SplashPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return (MaterialPageRoute(
    settings: settings,
    builder: (context) => child,
  ));
}
