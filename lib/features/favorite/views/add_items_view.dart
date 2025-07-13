import 'package:flutter/material.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';

class AddItemsView extends StatelessWidget {
  const AddItemsView({super.key});

  final Color primaryColor = const Color(0xFFB89256);

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Wings Tower',
        'price': 220,
        'rating': 4.9,
        'location': 'Reyadah',
        'image': AssetsManager.onBoarding1,
      },
      {
        'title': 'Mill Sper House',
        'price': 271,
        'rating': 4.8,
        'location': 'Jaddah',
        'image': AssetsManager.onBoarding1,
      },
      {
        'title': 'Bungalow House',
        'price': 235,
        'rating': 4.7,
        'location': 'Jakarta, Indonesia',
        'image': AssetsManager.onBoarding1,
      },
      {
        'title': 'Sky Dandelions Apartment',
        'price': 290,
        'rating': 4.9,
        'location': 'Jakarta, Indonesia',
        'image': AssetsManager.onBoarding1,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Your items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Add New Item Button
              GestureDetector(
                onTap: () {},
                child: DottedBorderContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Add new item',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Items Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.75,
                  children: items.map((item) => ItemCard(item)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFB89256),
          style: BorderStyle.solid,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: child),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: const Color(0xFFF7F7F7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with edit icon and price
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                child: Image.asset(
                  item['image'],
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB89256),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.edit, size: 16, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '\$ ${item['price']}/month',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              item['title'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFB89256),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  item['rating'].toString(),
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    item['location'],
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
