import 'package:flutter/material.dart';

import 'package:tic_tak_game/presentation/widgets/tasks_body_widget.dart';

class UnAssignedPage extends StatelessWidget {
  const UnAssignedPage({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TasksBody(
      tabController: tabController,
    );
  }
}
