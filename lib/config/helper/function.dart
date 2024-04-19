import 'package:flutter/material.dart';

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];

  List<Widget> withDivider({
    double endIndent = 10,
    double thickness = 1,
    indent = 10,
  }) {
    return [
      for (int i = 0; i < length; i++) ...[
        if (i > 1)
          Divider(endIndent: endIndent, thickness: thickness, indent: indent),
        if (i == length - 1)
          () {
            return Container(
              color: Colors.white,
            );
          }(),
        this[i],
      ],
    ];
  }
}
