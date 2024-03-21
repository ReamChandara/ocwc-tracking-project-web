import 'package:flutter/material.dart';

class ResponviceWorkerScreen extends StatefulWidget {
  final Widget desktopScreen;
  final Widget tabletScreen;
  final Widget phoneScreen;

  const ResponviceWorkerScreen(
      {super.key,
      required this.desktopScreen,
      required this.tabletScreen,
      required this.phoneScreen});

  @override
  State<ResponviceWorkerScreen> createState() => _ResponviceWorkerScreenState();
}

class _ResponviceWorkerScreenState extends State<ResponviceWorkerScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      double maxWidth = constraints.maxWidth;
      double maxHeight = constraints.maxHeight;
      if (maxWidth > 1350 && maxHeight > 920) {
        return widget.desktopScreen;
      } else if (maxWidth < 1350 && maxHeight < 920) {
        return widget.tabletScreen;
      } else {
        return widget.phoneScreen;
      }
    }));
  }
}
