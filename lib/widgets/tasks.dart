import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.circle_outlined),
            ),
            title: const Text(
              "go to home",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(
              Icons.delete_forever_rounded,
              size: 24,
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
