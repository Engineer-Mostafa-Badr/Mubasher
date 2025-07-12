import 'package:mubasher_app/core/custom_widget/arrow_back_leading_appbar.dart';
import 'package:mubasher_app/core/custom_widget/app_text_manager.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class StateView extends StatelessWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ArrowBackLeadingAppbar(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        PageRouteName.profileOptionsRoute,
                      );
                    },
                  ),
                  SizedBox(width: 28.w),
                  AppText(
                    text: 'State',
                    fontFamily: 'Lato',
                    fontSize: 20.px,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryChip(label: 'All', selected: true),
                  CategoryChip(label: 'City'),
                  CategoryChip(label: 'Country'),
                  CategoryChip(label: 'Rigion'),
                ],
              ),
              SizedBox(height: 3.h),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 2.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return PropertyCard(
                      isInstallment: index % 2 != 0,
                      duration: index == 3 ? '12 month' : null,
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

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;

  const CategoryChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.2.h),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFB58E47) : const Color(0xFFF6F5F9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final bool isInstallment;
  final String? duration;

  const PropertyCard({super.key, this.isInstallment = false, this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF6F5F9),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AssetsManager.paymentView,
                  height: 18.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color(0xFFB58E47),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF394C5F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '\$ 220/month',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Wings Tower',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: const Color(0xFFB58E47),
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.orange, size: 16),
              SizedBox(width: 4),
              Text('4.9'),
              SizedBox(width: 4),
              Icon(Icons.location_on, size: 16, color: Colors.brown),
              SizedBox(width: 2),
              Text('Reyadah'),
            ],
          ),
          SizedBox(height: 4),
          Text(
            isInstallment ? 'Installment' : 'Rent',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: const Color(0xFFB58E47),
            ),
          ),
          if (duration != null)
            Text(
              duration!,
              style: TextStyle(fontSize: 13.sp, color: Colors.black54),
            ),
        ],
      ),
    );
  }
}
