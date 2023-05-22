import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(
      {super.key,
      required this.label,
      this.labelSemantic,
      this.style,
      this.textAlign,
      this.semanticOrdinal});

  final String label;
  final String? labelSemantic;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? semanticOrdinal;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: OrdinalSortKey(semanticOrdinal ?? 0.0),
      label: labelSemantic ?? label,
      excludeSemantics: true,
      child: Tooltip(
        message: labelSemantic ?? label,
        child: Text(
          label,
          style: style,
          textAlign: textAlign,
        ),
      ),
    );
  }
}

// TODO: 
// 1. Agregar semantica y orden de semantica a cada widget y pantalla.
// 2. Agregar tooltip a cada texto para que sea mas descriptivo.
// 3. El celular diga que esta haciendo el usuario.
// 4. Que el texto permita hacer zoom con una lupa.   
