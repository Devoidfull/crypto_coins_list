import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color.fromARGB(255, 25, 25, 25),
      ),
      child: child,
    );
  }
}
