import 'package:flutter/material.dart';

class PaddingStandard extends StatelessWidget {
  const PaddingStandard({
    Key? key, required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: child);
  }
  }