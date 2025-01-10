import 'package:intl/intl.dart';

extension StringX on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() {
    return split(' ').map((str) => str.capitalize()).join(' ');
  }

  String toSnakeCase() {
    return split(' ').map((str) => str.toLowerCase()).join('_');
  }

  String toCamelCase() {
    return split('_').map((str) => str.capitalize()).join('');
  }

  String toPascalCase() {
    return split('_').map((str) => str.capitalize()).join('');
  }

  String get toArabicNumbers {
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
    return split('').map((char) {
      return englishToArabicDigits[char] ?? char;
    }).join();
  }

  String formatUtc({bool twoLines = true}) {
    // Parse the UTC date-time string and convert it to the local time zone
    DateTime dateTime = DateTime.parse(this).toLocal();

    // Use the Arabic locale for date formatting
    DateFormat formatter = DateFormat('d/M/yyyy h a');

    // Format the date and time to Arabic locale
    String formattedDate = formatter.format(dateTime);

    // Replace Western numerals with Arabic-Indic numerals
    String arabicFormatted = formattedDate.replaceAllMapped(
      RegExp(r'[0-9]'),
      (Match match) => _arabicDigits[match.group(0)!]!,
    );

    // Replace AM/PM with Arabic equivalents
    arabicFormatted = arabicFormatted
        .replaceAll('AM', 'ص') // Replace "AM" with "ص"
        .replaceAll('PM', 'م'); // Replace "PM" with "م"

    // Reorder the date parts and insert \n between date and time
    return _reorderDatePartsWithNewline(arabicFormatted,twoLines);
  }

  // Helper method to reorder date parts and add \n
  String _reorderDatePartsWithNewline(String formattedDate, bool twoLines) {
    // Split the date and time based on space
    List<String> parts = formattedDate.split(' ');

    // Split the date part by '/'
    List<String> dateParts = parts[0].split('/'); // [day, month, year]

    // Rearrange the date parts to dd/MM/yyyy
    String reorderedDate = '${dateParts[2]}/${dateParts[1]}/${dateParts[0]}';

    // Combine with the time part (h a) and insert \n between them
    return twoLines
        ? '$reorderedDate\n${parts[1]} : ${parts[2]}'
        : '$reorderedDate\t\t ${parts[1]} : ${parts[2]}';
  }

  // Map Western digits to Arabic-Indic numerals
  static const Map<String, String> _arabicDigits = {
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

  int get toInt => int.parse(this);

  double get toDouble => double.tryParse(this) ?? 0.0;

  DateTime toDateTime() => DateTime.parse(this);
}
