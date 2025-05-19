import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/core/custom_widget/custom_search_text_form_field.dart';
import 'package:mubasher_app/core/custom_widget/custom_property_card.dart';

class CustomHomeView extends StatelessWidget {
  const CustomHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22.h,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgImagesManager.backgroundAppBar,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12.w, bottom: 10.w),
                      child: SvgPicture.asset(SvgImagesManager.group22),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgImagesManager.notification,
                      height: 7.h,
                    ),
                    SizedBox(width: 4.w),
                    ClipOval(
                      child: Image.asset(
                        AssetsManager.ellipse,
                        width: 7.h,
                        height: 7.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CustomSearchTextFormField(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            children: [
              SizedBox(
                height: 150.px,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemExtent: 310.px,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.px),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetsManager.rectangle),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(25),
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
                      padding: EdgeInsets.only(right: 16.px),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Ads Here",
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryChip('All'),
                  _buildCategoryChip('House'),
                  _buildCategoryChip('Apartment'),
                  _buildCategoryChip('Villa'),
                ],
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 180.px,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(right: 14.px),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Image.asset(
                                AssetsManager.onBoarding1,
                                width: 270.px,
                                fit: BoxFit.cover,
                              ),

                              Positioned(
                                bottom: 6.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: const StadiumBorder(),
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        SvgImagesManager.shapeBigSale,
                                        width: 7.w,
                                        height: 10.h,
                                      ),
                                      SvgPicture.asset(
                                        SvgImagesManager.arrowRight,
                                        width: 5.h,
                                        height: 2.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
              ),
              SizedBox(height: 4.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
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
                    child: PropertyCard(
                      installment: index % 2 == 1,
                      // months: index == 3 ? "12 month" : null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildCategoryChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: ColorManager.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
