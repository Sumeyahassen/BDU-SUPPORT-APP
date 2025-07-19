class Course {
  final String id;
  final String name;
  final String? departmentId; // Nullable for common courses
  final List<String> videoUrls;
  final List<String> lectureNotes;
  final List<String> bookLinks;
  final List<String> examLinks;

  Course({
    required this.id,
    required this.name,
    this.departmentId,
    required this.videoUrls,
    required this.lectureNotes,
    required this.bookLinks,
    required this.examLinks,
  });
}
