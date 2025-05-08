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
  {"name": "Afghanistan", "dial_code": "+93", "flag": "🇦🇫"},
  {"name": "Albania", "dial_code": "+355", "flag": "🇦🇱"},
  {"name": "Algeria", "dial_code": "+213", "flag": "🇩🇿"},
  {"name": "Andorra", "dial_code": "+376", "flag": "🇦🇩"},
  {"name": "Angola", "dial_code": "+244", "flag": "🇦🇴"},
  {"name": "Argentina", "dial_code": "+54", "flag": "🇦🇷"},
  {"name": "Armenia", "dial_code": "+374", "flag": "🇦🇲"},
  {"name": "Australia", "dial_code": "+61", "flag": "🇦🇺"},
  {"name": "Austria", "dial_code": "+43", "flag": "🇦🇹"},
  {"name": "Azerbaijan", "dial_code": "+994", "flag": "🇦🇿"},
  {"name": "Bahrain", "dial_code": "+973", "flag": "🇧🇭"},
  {"name": "Bangladesh", "dial_code": "+880", "flag": "🇧🇩"},
  {"name": "Belgium", "dial_code": "+32", "flag": "🇧🇪"},
  {"name": "Brazil", "dial_code": "+55", "flag": "🇧🇷"},
  {"name": "Bulgaria", "dial_code": "+359", "flag": "🇧🇬"},
  {"name": "Canada", "dial_code": "+1", "flag": "🇨🇦"},
  {"name": "China", "dial_code": "+86", "flag": "🇨🇳"},
  {"name": "Colombia", "dial_code": "+57", "flag": "🇨🇴"},
  {"name": "Croatia", "dial_code": "+385", "flag": "🇭🇷"},
  {"name": "Cuba", "dial_code": "+53", "flag": "🇨🇺"},
  {"name": "Czech Republic", "dial_code": "+420", "flag": "🇨🇿"},
  {"name": "Denmark", "dial_code": "+45", "flag": "🇩🇰"},
  {"name": "Egypt", "dial_code": "+20", "flag": "🇪🇬"},
  {"name": "Finland", "dial_code": "+358", "flag": "🇫🇮"},
  {"name": "France", "dial_code": "+33", "flag": "🇫🇷"},
  {"name": "Germany", "dial_code": "+49", "flag": "🇩🇪"},
  {"name": "Greece", "dial_code": "+30", "flag": "🇬🇷"},
  {"name": "Hungary", "dial_code": "+36", "flag": "🇭🇺"},
  {"name": "India", "dial_code": "+91", "flag": "🇮🇳"},
  {"name": "Indonesia", "dial_code": "+62", "flag": "🇮🇩"},
  {"name": "Iran", "dial_code": "+98", "flag": "🇮🇷"},
  {"name": "Iraq", "dial_code": "+964", "flag": "🇮🇶"},
  {"name": "Ireland", "dial_code": "+353", "flag": "🇮🇪"},
  {"name": "Israel", "dial_code": "+972", "flag": "🇮🇱"},
  {"name": "Italy", "dial_code": "+39", "flag": "🇮🇹"},
  {"name": "Japan", "dial_code": "+81", "flag": "🇯🇵"},
  {"name": "Jordan", "dial_code": "+962", "flag": "🇯🇴"},
  {"name": "Kenya", "dial_code": "+254", "flag": "🇰🇪"},
  {"name": "Kuwait", "dial_code": "+965", "flag": "🇰🇼"},
  {"name": "Lebanon", "dial_code": "+961", "flag": "🇱🇧"},
  {"name": "Libya", "dial_code": "+218", "flag": "🇱🇾"},
  {"name": "Malaysia", "dial_code": "+60", "flag": "🇲🇾"},
  {"name": "Mexico", "dial_code": "+52", "flag": "🇲🇽"},
  {"name": "Morocco", "dial_code": "+212", "flag": "🇲🇦"},
  {"name": "Netherlands", "dial_code": "+31", "flag": "🇳🇱"},
  {"name": "New Zealand", "dial_code": "+64", "flag": "🇳🇿"},
  {"name": "Nigeria", "dial_code": "+234", "flag": "🇳🇬"},
  {"name": "Norway", "dial_code": "+47", "flag": "🇳🇴"},
  {"name": "Pakistan", "dial_code": "+92", "flag": "🇵🇰"},
  {"name": "Philippines", "dial_code": "+63", "flag": "🇵🇭"},
  {"name": "Poland", "dial_code": "+48", "flag": "🇵🇱"},
  {"name": "Portugal", "dial_code": "+351", "flag": "🇵🇹"},
  {"name": "Qatar", "dial_code": "+974", "flag": "🇶🇦"},
  {"name": "Romania", "dial_code": "+40", "flag": "🇷🇴"},
  {"name": "Russia", "dial_code": "+7", "flag": "🇷🇺"},
  {"name": "Saudi Arabia", "dial_code": "+966", "flag": "🇸🇦"},
  {"name": "South Africa", "dial_code": "+27", "flag": "🇿🇦"},
  {"name": "South Korea", "dial_code": "+82", "flag": "🇰🇷"},
  {"name": "Spain", "dial_code": "+34", "flag": "🇪🇸"},
  {"name": "Sudan", "dial_code": "+249", "flag": "🇸🇩"},
  {"name": "Sweden", "dial_code": "+46", "flag": "🇸🇪"},
  {"name": "Switzerland", "dial_code": "+41", "flag": "🇨🇭"},
  {"name": "Syria", "dial_code": "+963", "flag": "🇸🇾"},
  {"name": "Tunisia", "dial_code": "+216", "flag": "🇹🇳"},
  {"name": "Turkey", "dial_code": "+90", "flag": "🇹🇷"},
  {"name": "Ukraine", "dial_code": "+380", "flag": "🇺🇦"},
  {"name": "United Arab Emirates", "dial_code": "+971", "flag": "🇦🇪"},
  {"name": "United Kingdom", "dial_code": "+44", "flag": "🇬🇧"},
  {"name": "United States", "dial_code": "+1", "flag": "🇺🇸"},
  {"name": "Yemen", "dial_code": "+967", "flag": "🇾🇪"},
];
