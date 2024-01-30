// import 'dart:math';

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class ChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;

  Future<void> calcularIMC(
      {required double pAlcool, required double pGasolina}) async {
    imc = 0;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));

    imc = pAlcool / pGasolina;

    notifyListeners();
  }
}
