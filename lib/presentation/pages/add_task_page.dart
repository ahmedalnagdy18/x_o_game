import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tic_tak_game/common/buttons.dart';
import 'package:tic_tak_game/common/textfield.dart';
import 'package:tic_tak_game/presentation/pages/tasks_page.dart';
import 'package:tic_tak_game/presentation/widgets/appbar_widget.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _numberOfTasks = TextEditingController();
  final TextEditingController _sequenceOfTasks = TextEditingController();
  bool _isButtonEnabled = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _numberOfTasks.addListener(_isEnabled);
    _sequenceOfTasks.addListener(_isEnabled);
  }

  @override
  void dispose() {
    _numberOfTasks.dispose();
    _sequenceOfTasks.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _isEnabled() {
    setState(() {
      _isButtonEnabled =
          _numberOfTasks.text.isNotEmpty && _sequenceOfTasks.text.isNotEmpty;
    });
  }

  void _startTimer(int minutes) {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer(Duration(minutes: minutes), () {
      // Timer expired logic here
      // You can show a dialog, notification, or perform any other action
      print("Timer expired after $minutes minutes");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: _isEnabled,
            child: Column(
              children: [
                TextFieldWidget(
                  label: const Text('Number of tasks'),
                  hintText: 'Number of tasks',
                  keyboardType: TextInputType.number,
                  mycontroller: _numberOfTasks,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  label: const Text('Time in minutes'),
                  hintText: 'Time in minutes',
                  keyboardType: TextInputType.number,
                  mycontroller: _sequenceOfTasks,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  textColor: Colors.white,
                  color: _isButtonEnabled ? Colors.teal : Colors.grey,
                  onPressed: _isButtonEnabled
                      ? () {
                          int numberOfTasks = int.parse(_numberOfTasks.text);
                          int minutes = int.parse(_sequenceOfTasks.text);
                          int sequenceOfTasks =
                              int.parse(_sequenceOfTasks.text);

                          // Start the timer
                          _startTimer(minutes);

                          // Navigate to the TasksPage immediately
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TasksPage(
                              numberOfTasks: numberOfTasks,
                              sequenceOfTasks: sequenceOfTasks,
                            ),
                          ));
                        }
                      : null,
                  text: 'Go',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
