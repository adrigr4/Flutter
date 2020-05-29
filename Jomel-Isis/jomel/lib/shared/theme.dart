import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color firstColor = const Color(0xFFC40000);
  static const Color secondColor = const Color(0xFFFFFFFF);
   static const Color thirdColor = const Color(0xFF000000);
   static const Color  buttonColor = const Color(0xFF301818);

  static const primaryGradient = const LinearGradient(
    colors: const [firstColor, secondColor],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}