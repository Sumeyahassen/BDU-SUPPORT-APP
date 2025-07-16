class Course {
  final String name;
  final List<String> materials;
  final List<String> exams;
  final List<String> videos;

  Course({
    required this.name,
    this.materials = const [],
    this.exams = const [],
    this.videos = const [],
  });
}
