class Course {
  final String id;
  final String name;
  final bool isCommon;
  final List<String> departments; // Empty if common

  Course({
    required this.id,
    required this.name,
    this.isCommon = false,
    this.departments = const [],
  });
}
