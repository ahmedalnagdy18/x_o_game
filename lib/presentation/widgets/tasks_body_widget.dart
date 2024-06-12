import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_cubit.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_state.dart';
import 'package:tic_tak_game/presentation/pages/assigned_page.dart';

class TasksBody extends StatefulWidget {
  const TasksBody({
    super.key,
  });

  @override
  TasksBodyState createState() => TasksBodyState();
}

class TasksBodyState extends State<TasksBody> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) => state is TasksLoad
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    final task = state.tasks[index];
                    final timeRemaining =
                        task.endTime.difference(DateTime.now()).inSeconds;
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
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<TasksCubit>(context).assignedTask =
                                task;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AssignedPage(),
                                ));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(task.name),
                              Text('$timeRemaining s'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
    );
  }
}
