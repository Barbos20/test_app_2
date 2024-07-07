import 'package:flutter/material.dart';

Widget bodyWithPadding({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      top: 24,
      right: 20,
      bottom: 46,
    ),
    child: child,
  );
}
