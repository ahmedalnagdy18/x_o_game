import 'dart:async';

import 'package:flutter/material.dart';

class TasksBody extends StatefulWidget {
  final int numberOfTasks;
  final int sequenceOfTasks;

  const TasksBody({
    super.key,
    required this.numberOfTasks,
    required this.sequenceOfTasks,
  });

  @override
  TasksBodyState createState() => TasksBodyState();
}

class TasksBodyState extends State<TasksBody> {
  late List<int> _timeLeft;
  late List<Timer?> _timers;

  @override
  void initState() {
    super.initState();
    _timeLeft =
        List<int>.filled(widget.numberOfTasks, widget.sequenceOfTasks * 60);
    _timers = List<Timer?>.filled(widget.numberOfTasks, null);
    _startTimers();
  }

  @override
  void dispose() {
    for (var timer in _timers) {
      timer?.cancel();
    }
    super.dispose();
  }

  void _startTimers() {
    for (int i = 0; i < widget.numberOfTasks; i++) {
      _timers[i] = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_timeLeft[i] > 0) {
            _timeLeft[i]--;
          } else {
            timer.cancel();
          }
        });
      });
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: widget.numberOfTasks,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Task ${index + 1}'),
                    Text(_formatTime(_timeLeft[index])),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
