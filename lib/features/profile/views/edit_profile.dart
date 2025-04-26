import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF6EB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                ), // حط صورتك هنا
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

              // Form Fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProfileField(
                      title: 'Name',
                      value: 'Sallem ahmed',
                      isEditable: true,
                    ),
                    ProfileField(
                      title: 'Phone',
                      value: '+996 234567 345',
                      isEditable: true,
                    ),
                    ProfileField(
                      title: 'Whatsapp',
                      value: '+996 3456787654',
                      isEditable: true,
                    ),
                    ProfileField(
                      title: 'Email',
                      value: 'saLLEM3@gmail.com',
                      isEditable: true,
                    ),
                    ProfileField(
                      title: 'Country',
                      value: 'Egypt',
                      isEditable: true,
                    ),
                    ProfileField(
                      title: 'Password',
                      value: '',
                      isPassword: true,
                    ),
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

class ProfileField extends StatelessWidget {
  final String title;
  final String value;
  final bool isEditable;
  final bool isPassword;

  const ProfileField({
    super.key,
    required this.title,
    required this.value,
    this.isEditable = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.brown, fontSize: 14),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: Color(0xFFFFF6E9),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    value.isNotEmpty ? value : 'Password',
                    style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                isPassword
                    ? const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.brown,
                    )
                    : isEditable
                    ? const Icon(Icons.edit, size: 20, color: Colors.brown)
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
