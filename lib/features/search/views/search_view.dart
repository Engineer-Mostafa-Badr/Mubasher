import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/core/custom_widget/custom_search_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ArrowBackLeadingAppbar(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        PageRouteName.homeRoute,
                      );
                    },
                  ),
                ),
                SizedBox(width: 18.w),
                AppText(
                  textColor: ColorManager.primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  text: 'Search',
                  fontFamily: 'Lato',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomSearchTextFormField(),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FilterChipWidget(label: 'All', selected: true),
                FilterChipWidget(label: 'House'),
                FilterChipWidget(label: 'Apartment'),
                FilterChipWidget(label: 'vila'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Type',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FilterChipWidget(label: 'Installments'),
                FilterChipWidget(label: 'Sell'),
                FilterChipWidget(label: 'Rent'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Location',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonWidget(label: 'Country'),
                DropdownButtonWidget(label: 'Rigon'),
                DropdownButtonWidget(label: 'City'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Search results',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 10),
            const SearchResultItem(
              status: 'Waiting for payment',
              statusColor: Colors.orange,
            ),
            const SizedBox(height: 10),
            const SearchResultItem(status: 'Paid', statusColor: Colors.green),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({
    required this.label,
    this.selected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: selected ? Colors.brown : const Color(0xF6F5F9FF),
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}

class DropdownButtonWidget extends StatelessWidget {
  final String label;

  const DropdownButtonWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xF6F5F9FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final String status;
  final Color statusColor;

  const SearchResultItem({
    required this.status,
    required this.statusColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8EB),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AssetsManager.rectangle,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mill Sper House',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('4.8'),
                    SizedBox(width: 4),
                    Icon(Icons.location_on, size: 16, color: Colors.brown),
                    Text('Jaddah'),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '\$ 271/month',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('2 novamber 2023'),
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
