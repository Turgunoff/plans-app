// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'widgets/date_of_plans.dart';
import 'widgets/plans_information.dart';
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
  DateTime appointedDay = DateTime.now();

  void chooseDate(BuildContext context) {
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
              appointedDay = selectedDay;
            }),
          }
      },
    );
  }

  void previousDate() {
    setState(() {
      appointedDay = DateTime(
        appointedDay.year,
        appointedDay.month,
        appointedDay.day - 1,
      );
    });
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
            DateOfPlans(chooseDate, appointedDay, previousDate),
            const PlansInformation(),
            const Tasks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
