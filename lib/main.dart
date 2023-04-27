import 'package:flutter/material.dart';

import 'models/task_models.dart';
import 'widgets/date_of_plans.dart';
import 'widgets/plans_information.dart';
import 'widgets/add_plan.dart';
import 'widgets/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const PlansApp(),
    );
  }
}

class PlansApp extends StatefulWidget {
  const PlansApp({super.key});

  @override
  State<PlansApp> createState() => _PlansAppState();
}

class _PlansAppState extends State<PlansApp> {
  final PlansModel _plans = PlansModel();

  DateTime _appointedDay = DateTime.now();

  void _chooseDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then(
      (selectedDay) => {
        if (selectedDay != null)
          {
            setState(() {
              _appointedDay = selectedDay;
            }),
          }
      },
    );
  }

  void _previousDate() {
    setState(() {
      _appointedDay = DateTime(
        _appointedDay.year,
        _appointedDay.month,
        _appointedDay.day - 1,
      );
    });
  }

  void _nextDate() {
    setState(() {
      _appointedDay = DateTime(
        _appointedDay.year,
        _appointedDay.month,
        _appointedDay.day + 1,
      );
    });
  }

  void _markAsDone(String planId) {
    setState(() {
      _plans
          .todoByDay(_appointedDay)
          .firstWhere((plan) => plan.id == planId)
          .changePerformance();
    });
  }

  void _deletePlan(String planId) {
    setState(() {
      _plans.removePlan(planId);
    });
  }

  void _addPlan(String planName, DateTime planDay) {
    setState(() {
      _plans.addPlans(planName, planDay);
    });
    Navigator.of(context).pop();
  }

  void _addPlanWindow(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      context: context,
      builder: (ctx) {
        return NewPlan(_addPlan);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Plans App',
          style: TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DateOfPlans(_chooseDate, _appointedDay, _previousDate, _nextDate),
            PlansInformation(_plans.todoByDay(_appointedDay)),
            Tasks(_plans.todoByDay(_appointedDay), _markAsDone, _deletePlan),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPlanWindow(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
