import 'package:intl/intl.dart';

extension NumX on num {

  String toRoundedString({int fractionDigits = 1}) =>
      NumberFormat.decimalPattern().format(this).toString();

  String toArabicNumbers() {
    const englishToArabicDigits = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    // Replace each English digit with its Arabic counterpart
    return toStringAsFixed(1).split('').map((char) {
      if (char == '.') return '٬'; // Replace decimal point with Arabic separator
      return englishToArabicDigits[char] ?? char;
    }).join();
  }

  String get formatWeight {
    if (this >= 1000) {
      return "${(this / 1000).toStringAsFixed(1)} كيلو ";
    } else {
      return "${toStringAsFixed(1)} جرام ";
    }
  }
  int getWholeNumber() {
    return floor();
  }

  int getMilliPart() {
    double fractionalPart = toDouble() - floor();
    int milliValue = (fractionalPart * 1000).round();

    // Adjust for cases like 0.05 to 50 and 0.5 to 500
    if (milliValue < 100) {
      milliValue *= 10;
    } else if (milliValue < 10) {
      milliValue *= 100;
    }

    return milliValue;
  }
}
