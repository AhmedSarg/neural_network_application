import 'package:easy_localization/easy_localization.dart';

import '../../resources/strings_manager.dart';

class AppValidators {
  AppValidators._();

  static String? validateName(String? val) {
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val.trim().length <= 6) {
      return AppStrings.validationsFieldLengthMoreThen6.tr();
    } else {
      List<String> names = val.trim().split(" ");
      names.removeWhere((element) => element.length < 3);
      if (names.length < 3) {
        return AppStrings.validationsFullNameErrorText.tr();
      } else {
        return null;
      }
    }
  }

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
      // return "Please enter an email";
    } else if (val.trim().isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
      // return "Please enter an email";
    } else if (emailRegex.hasMatch(val) == false) {
      return AppStrings.validationsValidEmail.tr();
    } else {
      return null;
    }
  }

  static String? validateNationalID(String? val) {
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return AppStrings.validationsNumbersOnly.tr();
    } else if (val.trim().length != 14) {
      return AppStrings.validationsNumbersMustEqual14Digit.tr();
    } else {
      return null;
    }
  }

  static String? validatePhoneWhatsApp(String? val) {
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return AppStrings.validationsNumbersOnly.tr();
    } else if (val.trim().length != 11) {
      return AppStrings.validationsNumbersMustEqual11Digit.tr();
    } else {
      return null;
    }
  }

  static String? validateUniversity(String? val) {
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validateCollege(String? val) {
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validateAcademicYear(String? val) {
    if (val == null) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }
}
