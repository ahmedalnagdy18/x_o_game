class Task {
  String name;
  int duration;
  DateTime endTime;

  Task({required this.name, required this.duration})
      : endTime = DateTime.now().add(Duration(seconds: duration));
}
