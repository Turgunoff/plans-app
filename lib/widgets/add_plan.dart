import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addPlan;

  const NewPlan(this.addPlan, {super.key});

  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  final _planNameController = TextEditingController();

  DateTime? _planAddDate;

  void submit() {
    if (_planNameController.text.isEmpty || _planAddDate == null) {
      return;
    }
    widget.addPlan(_planNameController.text, _planAddDate);
  }

  void _addPlanToCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        setState(() {
          _planAddDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 16
              : 160,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter the plan",
              ),
              controller: _planNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_planAddDate == null
                    ? "no day selected..."
                    : DateFormat("d MMMM, yyyy").format(_planAddDate!)),
                TextButton(
                  onPressed: () {
                    _addPlanToCalendar(context);
                  },
                  child: const Text("SELECT A DAY"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: const Text("ADD"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
