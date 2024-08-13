class Task {
  String id;
  String name;
  String description;
  DateTime createdAt;
  int duration;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.duration,
  });
}
