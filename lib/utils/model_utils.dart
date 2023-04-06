class ModelUtils {
  static int? yearToInt(number) {
    if (number is int) {
      return number;
    }
    // For some reason year can be string with error text
    return null;
  }
}
