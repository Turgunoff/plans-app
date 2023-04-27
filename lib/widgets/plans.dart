import 'package:flutter/material.dart';

import '../models/task_models.dart';

class Plans extends StatelessWidget {
  final PlanModel reja;
  final Function bajarilganDebBelgila;
  final Function rejaniuchir;

  const Plans(this.reja, this.bajarilganDebBelgila, this.rejaniuchir,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: IconButton(
        onPressed: () {
          bajarilganDebBelgila(reja.id);
        },
        icon: Icon(
            reja.done ? Icons.check_circle_outline : Icons.circle_outlined),
        color: reja.done ? Colors.green : Colors.grey,
      ),
      title: Text(
        reja.name,
        style: TextStyle(
            fontSize: 18,
            fontWeight: reja.done ? FontWeight.normal : FontWeight.w500,
            decoration:
                reja.done ? TextDecoration.lineThrough : TextDecoration.none,
            color: reja.done ? Colors.green : Colors.black),
      ),
      trailing: IconButton(
        onPressed: () {
          rejaniuchir(reja.id);
        },
        icon: Icon(
          color: reja.done ? Colors.red : Colors.grey,
          Icons.delete_forever_rounded,
          size: 24,
        ),
      ),
    );
  }
}
