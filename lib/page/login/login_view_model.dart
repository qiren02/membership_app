import 'package:flutter/material.dart';

class LoginViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel() {
    emailController.addListener(() {
      // notifyListeners(); // Notify UI when text changes
    });
  }
}