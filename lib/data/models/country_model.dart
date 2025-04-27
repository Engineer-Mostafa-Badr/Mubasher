class CountryModel {
  String name;
  String countryEn;
  String countryAr;
  String countryISOCode;
  String currencyISOCode;
  String currAr;
  String mobileCountryCode;
  String flag;

  CountryModel({
    required this.name,
    required this.countryEn,
    required this.countryAr,
    required this.countryISOCode,
    required this.currencyISOCode,
    required this.currAr,
    required this.mobileCountryCode,
    required this.flag,
  });

  // Convert a Country object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'CountryEn': countryEn,
      'CountryAr': countryAr,
      'Country_ISO_Code': countryISOCode,
      'Currency_ISO_Code': currencyISOCode,
      'CurrAr': currAr,
      'Mobile_Country_Code': mobileCountryCode,
      'flag': flag,
    };
  }

  // Create a Country object from a Map object
  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'],
      countryEn: map['CountryEn'],
      countryAr: map['CountryAr'],
      countryISOCode: map['Country_ISO_Code'],
      currencyISOCode: map['Currency_ISO_Code'],
      currAr: map['CurrAr'],
      mobileCountryCode: map['Mobile_Country_Code'],
      flag: map['flag'],
    );
  }
}

List<CountryModel> countries = [
  CountryModel(
    name: "Egypt",
    countryEn: "Egypt",
    countryAr: "مصر",
    countryISOCode: "EGY",
    currencyISOCode: "EGP",
    currAr: "ج.م",
    mobileCountryCode: "+20",
    flag: "assets/flags/egypt.png",
  ),
  CountryModel(
    name: "KSA",
    countryEn: "Saudi Arabia",
    countryAr: "السعودية",
    countryISOCode: "SAU",
    currencyISOCode: "SAR",
    currAr: "ر.س",
    mobileCountryCode: "+966",
    flag: "assets/flags/ksa.png",
  ),
  CountryModel(
    name: "UAE",
    countryEn: "United Arab Emirates (UAE)",
    countryAr: "الامارات",
    countryISOCode: "ARE",
    currencyISOCode: "AED",
    currAr: "د.إ",
    mobileCountryCode: "+971",
    flag: "assets/flags/uae.webp",
  ),
  CountryModel(
    name: "Qatar",
    countryEn: "Qatar",
    countryAr: "قطر",
    countryISOCode: "QAT",
    currencyISOCode: "QAR",
    currAr: "ر.ق",
    mobileCountryCode: "+974",
    flag: "assets/flags/qatar.webp",
  ),
  CountryModel(
    name: "Oman",
    countryEn: "Oman",
    countryAr: "عمان",
    countryISOCode: "OMN",
    currencyISOCode: "OMR",
    currAr: "ر.ع",
    mobileCountryCode: "+968",
    flag: "assets/flags/oman.jpg",
  ),
  CountryModel(
    name: "Kuwait",
    countryEn: "Kuwait",
    countryAr: "الكويت",
    countryISOCode: "KWT",
    currencyISOCode: "KWD",
    currAr: "د.ك",
    mobileCountryCode: "+965",
    flag: "assets/flags/kuwait.webp",
  ),
  CountryModel(
    name: "Bahrain",
    countryEn: "Bahrain",
    countryAr: "البحرين",
    countryISOCode: "BHR",
    currencyISOCode: "BHD",
    currAr: "د.ب",
    mobileCountryCode: "+973",
    flag: "assets/flags/bahrain.jpeg",
  ),
];
