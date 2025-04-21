import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final golden = const Color(0xFFB98A35);
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFFB98A35),
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                style: textStyle.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "Create your ",
                    style: TextStyle(color: golden),
                  ),
                  const TextSpan(
                    text: "account",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "quis nostrud exercitation ullamco laboris nisi ut",
              style: textStyle.bodyMedium?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 32),

            // Full name
            buildInputField(Iconsax.user, 'Full name'),

            // Email
            buildInputField(Iconsax.sms, 'Email'),

            // Phone number
            buildInputField(Iconsax.call, 'Phone number'),

            // Whatsapp
            buildInputField(Iconsax.wallet1, 'Whatsapp'),

            // Password
            buildInputField(
              Iconsax.lock,
              'Password',
              isPassword: true,
              obscureText: _obscurePassword,
              onEyeTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Terms of service", style: textStyle.bodySmall),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  child: Text(
                    _obscurePassword ? "Show password" : "Hide password",
                    style: textStyle.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Register button
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: golden,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
    IconData icon,
    String hint, {
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onEyeTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFB98A35)),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          if (isPassword)
            GestureDetector(
              onTap: onEyeTap,
              child: Icon(
                obscureText ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
