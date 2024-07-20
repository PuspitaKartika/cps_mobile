class CapitalizeFormatter {
  static String capitalize(String s) => s.isNotEmpty
      ? s
          .split(' ')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ')
      : s;
}
