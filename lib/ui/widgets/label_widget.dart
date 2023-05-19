import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(
      {super.key,
      required this.label,
      this.labelSemantic,
      this.style,
      this.textAlign});

  final String label;
  final String? labelSemantic;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: labelSemantic ?? label,
      excludeSemantics: true,
      child: Text(
        label,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
