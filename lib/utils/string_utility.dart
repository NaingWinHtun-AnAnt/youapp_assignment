extension StringExtensions on String? {
  bool isNotNullOrEmpty() => this != null && this!.isNotEmpty;

  bool isEmail() => RegExp(
        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
        caseSensitive: false,
        multiLine: false,
      ).hasMatch((this ?? "").trim());
}
