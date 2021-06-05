import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paypal_app/src/ui/layout.dart';
import 'package:paypal_app/src/utils/constants.dart';
import 'package:paypal_app/src/utils/styles.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
                child: Image.asset(
                  'assets/logo.png',
                  width: screenWidth(context) / 2,
                  height: 90,
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                textAlign: TextAlign.center,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your name or email',
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                textAlign: TextAlign.center,
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 32),
              CustomButton(
                text: 'Log in',
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => MainLayout(),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Having trouble logging in?',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainLayout(),
                  ),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(color: AppColors.dark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => AppColors.deepBlue,
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => EdgeInsets.all(16),
        ),
      ),
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
