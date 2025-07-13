import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/core/custom_widget/custom_property_card.dart';

class CustomHomeSellerView extends StatefulWidget {
  const CustomHomeSellerView({super.key});

  @override
  State<CustomHomeSellerView> createState() => _CustomHomeSellerViewState();
}

class _CustomHomeSellerViewState extends State<CustomHomeSellerView> {
  String selectedCategory = 'Your products';
  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildLogo(), _buildActions()],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              children: [
                SizedBox(
                  height: 150.px,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemExtent: 310.px,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 16.px),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AssetsManager.rectangle),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  height: 103.px,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemExtent: 310.px,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 16.px),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Center(
                            child: AppText(
                              fontFamily: 'Raleway',
                              fontSize: 20.px,
                              fontWeight: FontWeight.w700,
                              textColor: ColorManager.white,
                              text: 'Ads Here',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryChip('Your products'),
                    _buildCategoryChip('Orders'),
                  ],
                ),
                SizedBox(height: 4.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  padding: const EdgeInsets.only(bottom: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.width < 400 ? 0.63 : 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:
                          () => Navigator.pushReplacementNamed(
                            context,
                            PageRouteName.productRoute,
                          ),
                      child: PropertyCard(installment: index % 2 == 1),
                    );
                  },
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 100.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(SvgImagesManager.backgroundAppBar),
          Padding(
            padding: EdgeInsets.only(right: 11.w, bottom: 10.w),
            child: SvgPicture.asset(SvgImagesManager.group22),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        SvgPicture.asset(SvgImagesManager.notification, height: 7.h),
        SizedBox(width: 4.w),
        ClipOval(
          child: Image.asset(
            AssetsManager.ellipse,
            width: 7.h,
            height: 9.h,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label) {
    final bool isSelected = selectedCategory == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Chip(
        label: AppText(
          text: label,
          fontFamily: 'Raleway',
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          fontSize: 16.px,
          textColor: isSelected ? ColorManager.white : ColorManager.black,
        ),
        backgroundColor:
            isSelected
                ? ColorManager.primaryColor
                : ColorManager.backgroundGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.w),
          side: BorderSide(
            color:
                isSelected ? ColorManager.primaryColor : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
