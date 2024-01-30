// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/imc_gauge.dart';
import 'change_notifier/change_notifier_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pAlcoolEC = TextEditingController();
  final pGasolinaEC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final controller = ChangeNotifierController();

  // Future<void> _calcularIMC(
  //     {required double peso, required double altura}) async {
  //   imc.value = 0;
  //   await Future.delayed(Duration(seconds: 1));
  //   imc.value = peso / pow(altura, 2);
  // }

  @override
  void dispose() {
    pAlcoolEC.dispose();
    pGasolinaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alcool X Gasolina',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return ImcGauge(imc: controller.imc);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pAlcoolEC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Preco Alcool',
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    )
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preco Alcool Obrigátorio';
                    }
                    return null;
                    //else if (value.length > 4) {
                    //   return 'Preco Alcool Inválido';
                    // }
                    // return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: pGasolinaEC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Preco Gasolina',
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    )
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preco Gasolina Obrigátorio';
                    }
                    return null;
                    // else if (value.length > 4) {
                    //   return 'Preco Gasolina Inválido';
                    // }
                    // return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formValid = formkey.currentState?.validate() ?? false;
                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR', decimalDigits: 2);
                      double pAlcool =
                          formatter.parse(pAlcoolEC.text) as double;
                      double pGasolina =
                          formatter.parse(pGasolinaEC.text) as double;

                      controller.calcularIMC(
                          pAlcool: pAlcool, pGasolina: pGasolina);
                    }
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
