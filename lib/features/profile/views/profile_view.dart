import 'package:flutter/material.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF6EB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.brown,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Title
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 15),

              // Profile Image
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  SvgImagesManager.ellipse,
                ), // صورتك هنا
              ),
              const SizedBox(height: 10),

              // Name
              const Text(
                'Sallem ahmed',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // Menu Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    MenuItem(title: 'Your personal information'),
                    MenuItem(title: 'About us'),
                    MenuItem(title: 'Change language'),
                    MenuItem(title: 'Change country'),
                    MenuItem(title: 'Contact us'),
                    MenuItem(title: 'Terms and conditions'),
                    MenuItem(title: 'Privacy and policy'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF6E9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
