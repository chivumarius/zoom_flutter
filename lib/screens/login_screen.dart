import 'package:flutter/material.dart';
import 'package:zoom_flutter/resources/auth_methods.dart';
import 'package:zoom_flutter/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  // ♦ Constructor
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ♦ initializing the 'AuthMethods()' function
  final AuthMethods _authMethods = AuthMethods();

  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ♦ Text:
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // ♦ Image:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),

          // ♦ 'Google Sign In' Button:
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              // ♦ Creating the "Google Authentication":
              bool res = await _authMethods.signInWithGoogle(context);

              // ♦ Checking: If the "Google Authentication" is "Successful":
              if (res) {
                if (!mounted) return;

                // ♦ Redirecting "User" to the "Home Screen":
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
