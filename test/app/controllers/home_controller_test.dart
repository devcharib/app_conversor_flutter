//Testar o HomeController antes
import 'package:flutter/material.dart';
import 'package:flutter_app_conversor/app/controllers/home_controller.dart';
import 'package:flutter_app_conversor/app/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  //Test de Unidade
  test('deve converter de real para dolar', () {
    //indico um valor
    toText.text = '2.0';
    //chamo a função de converter
    homeController.convert();
    //compara o resultado com o esperado
    expect(fromText.text, '0.36');
  });

  test('deve converter de dolar para real', () {
    //indico um valor
    toText.text = '1.0';
    // modificando to campo
    homeController.toCurrency = CurrencyModel(
        name: 'Dolar', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    //modificando from campo
    homeController.fromCurrency = CurrencyModel(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    //chamo a função de converter
    homeController.convert();
    //compara o resultado com o esperado
    expect(fromText.text, '5.65');
  });
}
