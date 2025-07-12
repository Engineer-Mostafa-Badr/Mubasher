import 'package:mubasher_app/core/custom_widget/custom_search_text_form_field.dart';
import 'package:mubasher_app/core/custom_widget/arrow_back_leading_appbar.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header with Back Arrow and Title
                Row(
                  children: [
                    ArrowBackLeadingAppbar(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRouteName.homeRoute,
                        );
                      },
                    ),
                    SizedBox(width: 27.w),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFB58E47),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                CustomSearchTextFormField(),
                Wrap(
                  spacing: 2.h,
                  children: const [
                    FilterChipWidget(label: 'All', selected: true),
                    FilterChipWidget(label: 'House'),
                    FilterChipWidget(label: 'Apartment'),
                    FilterChipWidget(label: 'Villa'),
                  ],
                ),
                SizedBox(height: 20.sp),
                _buildSectionTitle('Type'),
                SizedBox(height: 10.sp),
                Wrap(
                  spacing: 2.h,
                  children: const [
                    FilterChipWidget(label: 'Installments'),
                    FilterChipWidget(label: 'Sell'),
                    FilterChipWidget(label: 'Rent'),
                  ],
                ),
                SizedBox(height: 20.sp),
                _buildSectionTitle('Location'),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    DropdownButtonWidget(label: 'Country'),
                    SizedBox(width: 10),
                    DropdownButtonWidget(label: 'Region'),
                    SizedBox(width: 10),
                    DropdownButtonWidget(label: 'City'),
                  ],
                ),
                SizedBox(height: 20.sp),
                _buildSectionTitle('Search results'),
                SizedBox(height: 10.sp),
                const SearchResultItem(
                  status: 'Waiting for payment',
                  statusColor: Colors.orange,
                ),
                SizedBox(height: 16.sp),
                const SearchResultItem(
                  status: 'Paid',
                  statusColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFB58E47),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({
    super.key,
    required this.label,
    this.selected = false,
  });
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      backgroundColor:
          selected ? const Color(0xFFB58E47) : const Color(0xFFF6F5F9),
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
    );
  }
}

class DropdownButtonWidget extends StatelessWidget {
  final String label;

  const DropdownButtonWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F5F9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), const Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final String status;
  final Color statusColor;

  const SearchResultItem({
    super.key,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8EB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AssetsManager.paymentView,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mill Sper House',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.sp),
                Row(
                  children: const [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('4.8'),
                    SizedBox(width: 8),
                    Icon(Icons.location_on, size: 16, color: Colors.brown),
                    SizedBox(width: 4),
                    Text('Jaddah'),
                  ],
                ),
                SizedBox(height: 6.sp),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.sp,
                    vertical: 4.sp,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '\$271/month',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 6.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('2 November 2023'),
                    Text(status, style: TextStyle(color: statusColor)),
                  ],
                ),
                const Text('NO.23456EE45'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
