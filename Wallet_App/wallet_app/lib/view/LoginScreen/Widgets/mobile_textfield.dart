import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/countrycode_controller.dart';
import 'package:wallet_app/model/countrycode_model.dart';

class MobileTextfield extends StatelessWidget {
  const MobileTextfield({super.key});


  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    /// INSTANTIATING COUNTRYCODECONTROLLER AND ADDING IT TO GETX DEPENDENCY INJECTION SYSTEM
    final CountryCodeController countryCodeController =
        Get.put(CountryCodeController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///TEXT
        Text(
          "Mobile number",
          style: GoogleFonts.sora(
            fontSize: deviceWidth * 0.03, //12
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        SizedBox(height: deviceHeight * 0.004),

        ///TEXTFIELD WITH COUNTRY CODE DROPDOWN AS PREFIX
        SizedBox(
          height: deviceHeight * 0.05,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            cursorColor: const Color.fromRGBO(83, 93, 102, 1),
            decoration: InputDecoration(
              /// PREFIX ICON WITH DROPDOWN
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonHideUnderline(
                    child: Obx(() {
                      return DropdownButton<CountryCodeModel>(
                        value:
                            countryCodeController.selectedCountryCode.value,
                        items:
                            countryCodeController.countryCodes.map((country) {
                          return DropdownMenuItem<CountryCodeModel>(
                            value: country,
                            child: Row(
                              children: [
                                ///FLAG IMAGE
                                Image.asset(
                                  country.flag,
                                  width: deviceWidth * 0.07,
                                  height: deviceHeight * 0.02,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: deviceWidth * 0.02),
          
                                ///COUNTRY CODE
                                Text(
                                  country.code,
                                  style: GoogleFonts.sora(
                                    fontSize: deviceWidth * 0.03,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (CountryCodeModel? newValue) {
                          if (newValue != null) {
                            ///SET COUNTRY CODE
                            countryCodeController.updateCountryCode(newValue);
                          }
                        },
                      );
                    }),
                  ),
                ),
              ),
          
              ///HINTTEXT
              hintText: "7X-XXXXXXX",
              hintStyle: GoogleFonts.sora(
                fontSize: deviceWidth * 0.03, //12
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(186, 194, 199, 1),
              ),
          
              ///ALL BORDER DECORATION FOR TEXTFIELD
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                ),
              ),
            ),
          
            /// VALIDATION FUNCTION TO CHECK IF THE INPUT IS A VALID MOBILE NUMBER
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                return 'Please enter a valid 10-digit mobile number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
