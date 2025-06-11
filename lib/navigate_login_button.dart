import 'package:fake_login/login_screen.dart';
import 'package:flutter/material.dart';

class NavigateLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const NavigateLoginButton({Key? key, this.onPressed}) : super(key: key);

  void navigateToLogin(BuildContext context) {
    // Logic to navigate to the login screen
    if (onPressed != null) {
      onPressed!();
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      icon: const Icon(Icons.adb), // Dinosaur-like icon
      label: const Text(
        'Login to continue',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: () => navigateToLogin(context),
    );
  }
}
