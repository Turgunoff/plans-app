import 'package:flutter/material.dart';

import '../models/task_models.dart';
import 'plans.dart';

class Tasks extends StatelessWidget {
  final List<PlanModel> plans;
  final Function markAsDone;
  final Function deletePlan;

  const Tasks(this.plans, this.markAsDone, this.deletePlan, {super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: plans.isNotEmpty
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Plans(plans[index], markAsDone, deletePlan);
              },
              itemCount: plans.length,
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "No tasks found.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  "assets/images/sleep.png",
                  fit: BoxFit.cover,
                  width: 150,
                )
              ],
            ),
    );
  }
}
