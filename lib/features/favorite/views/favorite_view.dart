import 'package:mubasher_app/core/custom_widget/arrow_back_leading_appbar.dart';
import 'package:mubasher_app/core/custom_widget/custom_property_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackLeadingAppbar(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.homeUserRoute,
                  );
                },
              ),
              SizedBox(height: 2.h),
              Text(
                "Favorite",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.builder(
                      itemCount: 4,
                      padding: const EdgeInsets.only(bottom: 12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            constraints.maxWidth < 400 ? 0.63 : 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return PropertyCard(
                          installment: index % 2 == 1,
                          // months: index == 3 ? "12 month" : null,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
