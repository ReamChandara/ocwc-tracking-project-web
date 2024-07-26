import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 71, 122, 211),
              width: 5,
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0.50, 0.50),
                blurRadius: 1,
                blurStyle: BlurStyle.outer)
          ],
        ),
        child: child);
  }
}
