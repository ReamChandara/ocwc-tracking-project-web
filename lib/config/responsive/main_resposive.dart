import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainResposive extends GetResponsiveView {
  final Widget? large;
  final Widget? medium;
  final Widget? small;
  MainResposive({super.key, this.large, this.medium, this.small});

  @override
  Widget? desktop() {
    return large;
  }

  @override
  Widget? tablet() {
    return medium;
  }

  @override
  Widget? phone() {
    return small;
  }
}
