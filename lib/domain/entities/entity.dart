class Task {
  String name;
  int duration; // Duration in seconds
  DateTime endTime;

  Task({required this.name, required this.duration})
      : endTime = DateTime.now().add(Duration(seconds: duration));
}
