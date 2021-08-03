import 'package:flutter/material.dart';

class Template {
  static textBase({String? texto, double? fontSize, Color? color, FontWeight? fontWeight}) {
    return Text(texto!,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize));
  }

  static textTitulo({String? texto}) {
    return textBase(texto: texto, fontSize: 20, color: Colors.red);
  }
  static textTituloSec({String? texto}) {
    return textBase(texto: texto, color: Colors.black);
  }

}