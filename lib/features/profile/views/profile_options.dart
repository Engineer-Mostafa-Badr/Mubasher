import 'package:flutter/material.dart';

class ProfileOptionsView extends StatelessWidget {
  const ProfileOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF6EB),
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
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

            // Profile Info
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 15),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'), // حط صورتك هنا
            ),
            const SizedBox(height: 10),
            const Text(
              'Sallem ahmed',
              style: TextStyle(
                fontSize: 20,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Options
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    ProfileOption(
                      icon: Icons.remove_red_eye,
                      label: 'Show profile',
                    ),
                    ProfileOption(icon: Icons.edit, label: 'About us'),
                    ProfileOption(
                      icon: Icons.grid_view,
                      label: 'Your products',
                    ),
                    ProfileOption(
                      icon: Icons.language,
                      label: 'change language',
                    ),
                    ProfileOption(icon: Icons.public, label: 'change country'),
                    ProfileOption(icon: Icons.logout, label: 'Log out'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileOption({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9C9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          // هنا تقدر تضيف اللي يحصل لما تدوس علي الزرار
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.brown),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
