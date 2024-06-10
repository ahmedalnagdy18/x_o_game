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
    super.dispose();
  }

  void _isEnabled() {
    setState(() {
      _isButtonEnabled =
          _numberOfTasks.text.isNotEmpty && _sequenceOfTasks.text.isNotEmpty;
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
                  label: const Text('Sequence of each task'),
                  hintText: 'Sequence of each task',
                  keyboardType: TextInputType.number,
                  mycontroller: _sequenceOfTasks,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  textColor: Colors.white,
                  color: _isButtonEnabled ? Colors.teal : Colors.grey,
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TasksPage()));
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
