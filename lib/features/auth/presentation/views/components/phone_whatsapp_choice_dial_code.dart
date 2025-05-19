import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CountryListWidget extends StatelessWidget {
  final Function(String code, String flag) onCountrySelected;
  final String? flag;

  const CountryListWidget({
    super.key,
    required this.onCountrySelected,
    this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return ListTile(
          leading: Text(country['flag']!),
          title: Text(country['name']!),
          trailing: Text(country['dial_code']!),
          onTap: () {
            onCountrySelected(country['dial_code']!, country['flag']!);
          },
        );
      },
    );
  }
}

List<Map<String, String>> countries = [
  {"name": "Egypt", "dial_code": "+20", "flag": "🇪🇬"},
  {"name": "United Arab Emirates", "dial_code": "+971", "flag": "🇦🇪"},
  {"name": "Saudi Arabia", "dial_code": "+966", "flag": "🇸🇦"},
  {"name": "Kuwait", "dial_code": "+965", "flag": "🇰🇼"},
  {"name": "Oman", "dial_code": "+968", "flag": "🇴🇲"},
  {"name": "Qatar", "dial_code": "+974", "flag": "🇶🇦"},
  {"name": "Bahrain", "dial_code": "+973", "flag": "🇧🇭"},
];
