import 'package:get/get.dart';
import 'package:wallet_app/model/countrycode_model.dart';

class CountryCodeController extends GetxController {
  ///LIST OF COUNTRIES WITH THEIR FLAGS AND COUNTRY CODES
  final List<CountryCodeModel> countryCodes = [
    const CountryCodeModel(
        code: "+91", flag: "assets/images/flags/india.png", country: "India"),
    const CountryCodeModel(
        code: "+1", flag: "assets/images/flags/usa.png", country: "USA"),
    const CountryCodeModel(
        code: "+44", flag: "assets/images/flags/uk.png", country: "UK"),
    const CountryCodeModel(
        code: "+61",
        flag: "assets/images/flags/australia.png",
        country: "Australia"),
    const CountryCodeModel(
        code: "+965",
        flag: "assets/images/flags/kuwait.png",
        country: "Kuwait"),
  ];

  /// OBSERVABLE VARIABLE FOR SELECTED COUNTRY CODE MODEL
  var selectedCountryCode = const CountryCodeModel(
          code: "+91", flag: "assets/images/flags/india.png", country: "India")
      .obs;

  ///FUNCTION TO UPDATE THE SELECTED COUNTRY CODE MODEL
  void updateCountryCode(CountryCodeModel countryCode) {
    selectedCountryCode.value = countryCode;
  }
}
