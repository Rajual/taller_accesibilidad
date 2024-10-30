import 'package:flutter/material.dart';
import 'package:taller_accesibilidad/ui/models/locale_model.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    this.item,
    this.style,
    this.textAlign,
  });

  final ItemModel? item;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: item?.semantic ?? item?.label,
      child: Text(
        item?.label ?? '',
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}

// TODO: 
// 1. Agregar semantica y orden de semantica a cada widget y pantalla.
// 2. Agregar tooltip a cada texto para que sea mas descriptivo.
// 3. El celular diga que esta haciendo el usuario.
// 4. Que el texto permita hacer zoom con una lupa.   
