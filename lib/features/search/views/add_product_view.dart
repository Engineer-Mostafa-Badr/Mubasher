import 'package:mubasher_app/core/resources/app_color_manager.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFF6F2F0),
                      child: Icon(Icons.arrow_back, color: Color(0xFF9C7A3E)),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Add item',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C7A3E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _imagePlaceholder(),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        _smallImagePlaceholder(),
                        const SizedBox(height: 8),
                        _smallImagePlaceholder(),
                      ],
                    ),
                    const SizedBox(width: 16),
                    _videoPlaceholder(),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _optionSwitch('Direct sale'),
                    const SizedBox(width: 16),
                    _optionSwitch('Show saller info'),
                  ],
                ),
                const SizedBox(height: 16),
                _textField('Arabic name'),
                const SizedBox(height: 8),
                _textField('English name'),
                const SizedBox(height: 8),
                _textField('Arabic description', height: 80),
                const SizedBox(height: 8),
                _textField('English description', height: 80),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C7A3E),
                      ),
                    ),
                    Icon(Icons.add, color: Color(0xFF9C7A3E)),
                  ],
                ),
                const SizedBox(height: 8),
                _priceOption('For sale'),
                const SizedBox(height: 8),
                _priceOption('For rent', withTime: true),
                const SizedBox(height: 8),
                _installmentOption(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _textField('Sold units')),
                    const SizedBox(width: 8),
                    Expanded(child: _textField('Available units')),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB48C49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePlaceholder() => Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: const Color(0xFFFEF8F0),
      borderRadius: BorderRadius.circular(24),
    ),
    child: const Center(
      child: Icon(Icons.add, size: 32, color: Color(0xFFD6B98B)),
    ),
  );

  Widget _smallImagePlaceholder() => Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: const Color(0xFFFEF8F0),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Center(
      child: Icon(Icons.add, size: 20, color: Color(0xFFD6B98B)),
    ),
  );

  Widget _videoPlaceholder() => Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: const Color(0xFFFEF8F0),
      borderRadius: BorderRadius.circular(24),
    ),
    child: const Center(
      child: Icon(Icons.add, size: 32, color: Color(0xFFD6B98B)),
    ),
  );

  Widget _optionSwitch(String text) => Row(
    children: [
      const CircleAvatar(radius: 10, backgroundColor: Color(0xFFFEF8F0)),
      const SizedBox(width: 4),
      Text(text, style: const TextStyle(color: Color(0xFFB48C49))),
    ],
  );

  Widget _textField(String hint, {double height = 48}) => Container(
    height: height,
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFFEF8F0),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(hint, style: const TextStyle(color: Colors.grey)),
    ),
  );

  Widget _priceOption(String title, {bool withTime = false}) => Column(
    children: [
      Row(
        children: [
          const CircleAvatar(radius: 10, backgroundColor: Color(0xFFFEF8F0)),
          const SizedBox(width: 4),
          Text(title, style: const TextStyle(color: Color(0xFFB48C49))),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(child: _textField('Price')),
          const SizedBox(width: 8),
          Expanded(child: _textField('Country')),
          const SizedBox(width: 8),
          Expanded(child: _textField('Discount')),
        ],
      ),
      if (withTime)
        Row(
          children: const [
            CircleAvatar(radius: 8, backgroundColor: Color(0xFFFEF8F0)),
            SizedBox(width: 4),
            Text('month'),
            SizedBox(width: 16),
            CircleAvatar(radius: 8, backgroundColor: Color(0xFFFEF8F0)),
            SizedBox(width: 4),
            Text('Year'),
          ],
        ),
    ],
  );

  Widget _installmentOption() => Column(
    children: [
      Row(
        children: [
          const CircleAvatar(radius: 10, backgroundColor: Color(0xFFFEF8F0)),
          const SizedBox(width: 4),
          const Text(
            'For installments',
            style: TextStyle(color: Color(0xFFB48C49)),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(child: _textField('Price')),
          const SizedBox(width: 8),
          Expanded(child: _textField('Country')),
          const SizedBox(width: 8),
          Expanded(child: _textField('Number of ins')),
        ],
      ),
    ],
  );
}
