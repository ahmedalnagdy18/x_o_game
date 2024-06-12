import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_cubit.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_state.dart';

class CompletedTasksBody extends StatefulWidget {
  const CompletedTasksBody({
    super.key,
  });

  @override
  CompletedTasksBodyState createState() => CompletedTasksBodyState();
}

class CompletedTasksBodyState extends State<CompletedTasksBody> {
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
    tasks = BlocProvider.of<TasksCubit>(context).completetasks;

    return BlocBuilder<TasksCubit, TasksState>(
        builder: (BuildContext context, state) => Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];

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
                            Text(task.name),
                            const Text('completed '),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
  }
}
