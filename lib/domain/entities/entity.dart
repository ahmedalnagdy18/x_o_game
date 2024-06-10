import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final Duration duration;
  final DateTime startTime;

  const Task({
    required this.id,
    required this.title,
    required this.duration,
    required this.startTime,
  });

  @override
  List<Object> get props => [id, title, duration, startTime];
}
