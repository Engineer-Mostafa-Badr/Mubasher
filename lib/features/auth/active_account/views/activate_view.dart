import 'package:flutter/material.dart';

class ActivateView extends StatefulWidget {
  const ActivateView({super.key});

  @override
  State<ActivateView> createState() => _ActivateViewState();
}

class _ActivateViewState extends State<ActivateView> {
  String selectedMethod = 'Email';

  final methods = ['Email', 'Sms code', 'Whatsapp code'];

  Widget _buildRadioTile(String label, IconData icon, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<String>(
              value: label,
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
              activeColor: Color(0xFFB38A43),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xF6F6F8FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFFB38A43)),
              const SizedBox(width: 12),
              Text(
                hintText,
                style: const TextStyle(color: Color(0xFFB0B0C3), fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFF6F6F8),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFFB38A43),
                  ),
                ),
                const SizedBox(height: 24),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Activate your ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFB38A43),
                        ),
                      ),
                      TextSpan(
                        text: 'account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please select a method for confirming your identity',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                _buildRadioTile('E mail', Icons.email_outlined, 'Email'),
                _buildRadioTile('Sms code', Icons.phone, 'Phone number'),
                const SizedBox(height: 24),
                const Text(
                  'Choose your method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xF6F6F8FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.email_outlined, color: Color(0xFFB38A43)),
                      SizedBox(width: 12),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFFB0B0C3),
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB38A43),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
