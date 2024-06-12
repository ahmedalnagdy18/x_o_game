import 'package:flutter/material.dart';

import 'package:tic_tak_game/presentation/pages/assigned_page.dart';
import 'package:tic_tak_game/presentation/pages/completed_page.dart';
import 'package:tic_tak_game/presentation/pages/unassigned_page.dart';
import 'package:tic_tak_game/presentation/widgets/appbar_widget.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({
    super.key,
  });

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>
    with SingleTickerProviderStateMixin {
  static late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TabBar(
                  dividerColor: Colors.white,
                  dividerHeight: 4,
                  controller: _tabController,
                  indicatorPadding: const EdgeInsets.all(10),
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  tabs: const [
                    Tab(text: 'UnAssigned'),
                    Tab(text: 'Assigned'),
                    Tab(text: 'Completed'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      UnAssignedPage(),
                      AssignedPage(),
                      CompletedPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
