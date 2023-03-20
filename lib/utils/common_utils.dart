String emptyString() {
  return "";
}

List<T> emptyList<T>([bool growable = false]) {
  return List.empty(growable: growable);
}

extension StringExtension on String? {
  String orEmpty() {
    return this ?? '';
  }
}

extension IntExtension on int? {
  int orZero() {
    return this ?? 0;
  }
}

extension DoubleExtension on double? {
  double orZero() {
    return this ?? 0;
  }
}