import 'package:mubasher_app/core/custom_widget/arrow_back_leading_appbar.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:mubasher_app/core/resources/app_color_manager.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ArrowBackLeadingAppbar(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      PageRouteName.homeRoute,
                    );
                  },
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(AssetsManager.backgroundView),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Icon(Icons.settings, color: Colors.brown),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Installments",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Appartment in 23 street",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Our recommended real estates in Jakarta Our recommended real estates in JakartaOur recommended real estates in Jakarta",
                  style: TextStyle(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "On 12 month",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "\$ 290",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("/per month", style: TextStyle(color: Colors.brown)),
                  ],
                ),
                SizedBox(height: 16),
                infoText("Country", "Saudi arabia"),
                infoText("Region", "Ryadaah"),
                infoText("Area", "Tabook"),
                infoText("Building type", "Duplex"),
                SizedBox(height: 16),
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(AssetsManager.backgroundView),
                    ),
                  ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Ask for buyer data",
                        style: TextStyle(color: ColorManager.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          PageRouteName.paymentRoute,
                        );
                      },
                      child: Text(
                        "Pay now",
                        style: TextStyle(color: ColorManager.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$title :", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}
