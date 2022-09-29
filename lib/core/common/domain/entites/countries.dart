import 'package:easy_localization/easy_localization.dart';

class Countries {
  late List<Country> countriesData = [];

  Countries() {
    final Country syria = Country(
      id: 1,
      countryName: "syria".tr(),
      flagImagePath: "assets/images/icons/romania.svg",
    );


    countriesData.addAll([syria]);
  }
}

class Country {
  final int id;
  final String flagImagePath;
  final String countryName;
  bool? isSelected = false;

  Country({
    required this.id,
    required this.countryName,
    required this.flagImagePath,
    this.isSelected,
  });
}
