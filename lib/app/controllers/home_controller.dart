//controller da home
import 'package:flutter/material.dart';
import 'package:flutter_app_conversor/app/models/currency_model.dart';

class HomeController {
  //lista do MODEL
  late List<CurrencyModel> currencies;
  //editar o VIEW
  // TextEditingController toText = TextEditingController();
  // TextEditingController fromText = TextEditingController();

  //para o Test.dart
  final TextEditingController toText;
  final TextEditingController fromText;

  //calcular no CONTROLLER
  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  // HomeController() {
  //   currencies = CurrencyModel.getCurrencies();
  //   toCurrency = currencies[0];
  //   fromCurrency = currencies[1];
  // }

  //para o test.dart
  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  //regra de negocio - calculo
  void convert() {
    String text = toText.text;
    //convertendo de String para Double
    // se não converter o (??) faz o null ser trocado pelo '1.0'
    // replace(evitar erros de virgula -> ponto[2,0 = 2.0])
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double convertValue = 0;

    switch (fromCurrency.name) {
      case 'Real':
        convertValue = value * toCurrency.real;
        break;
      case 'Dolar':
        convertValue = value * toCurrency.dolar;
        break;
      case 'Euro':
        convertValue = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        convertValue = value * toCurrency.bitcoin;
        break;
      default:
        convertValue = value * 0;
    }

    //converte para string com ,00 - ex: 10,00
    fromText.text = convertValue.toStringAsFixed(2);
  }
}
