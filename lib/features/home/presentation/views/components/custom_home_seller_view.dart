import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubasher_app/core/custom_widget/custom_property_card.dart';
import 'package:mubasher_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:mubasher_app/features/home/data/repositories/home_repository_imp.dart';
import 'package:mubasher_app/features/home/domain/entities/home_entity.dart';
import 'package:mubasher_app/features/home/presentation/view_models/home_bloc.dart';
import 'package:mubasher_app/features/home/presentation/view_models/home_event.dart';
import 'package:mubasher_app/features/home/presentation/view_models/home_states.dart';

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

    return BlocProvider(
      create:
          (context) =>
              HomeBloc(HomeRepositoryImpl(HomeRemoteDataSource()))
                ..add(LoadHomeEvent()),
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_buildLogo(), _buildActions()],
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    final data = state.data;

                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        // ✅ Banner
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemExtent: 300,
                            itemBuilder: (context, index) {
                              final HomeEntity item = data[index];
                              return Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 12,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${item.homeUrl}${item.photoUrl}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ✅ Ads
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemExtent: 280,
                            itemBuilder: (context, index) {
                              final HomeEntity item = data[index];
                              return Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 12,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.titleEn.isNotEmpty
                                          ? item.titleEn
                                          : "Ads Here",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ✅ Category chips
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildCategoryChip('Your products'),
                            _buildCategoryChip('Orders'),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // ✅ Grid products
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          padding: const EdgeInsets.only(bottom: 12),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                          itemBuilder: (context, index) {
                            return PropertyCard(
                              installment: index % 2 == 1,
                              // هنا تقدر تبعت الـ item وتعدل PropertyCard يعرض بياناته
                            );
                          },
                        ),
                      ],
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text("Error: ${state.message}"));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset("assets/svg/background_appbar.svg"),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 8),
            child: SvgPicture.asset("assets/svg/group22.svg"),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        SvgPicture.asset("assets/svg/notification.svg", height: 30),
        const SizedBox(width: 12),
        ClipOval(
          child: Image.asset(
            "assets/images/ellipse.png",
            width: 40,
            height: 40,
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
        label: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
