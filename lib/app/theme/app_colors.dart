import 'dart:core';

import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundPrimary;
  Color get button;
  Color get titleAppBar;
  Color get titleMercadoria;
  Color get titleEstoque;
  Color get titlePontos;
  Color get logadoComSucesso;
  Color get backgroundButton;
  MaterialColor get primary;

  final String hex = '0xff';
  final String colorFinal = '700391';
  final int hexFinal = 0;
}

class AppColorDefault implements AppColors {
  @override
  Color get button => Colors.white;

  @override
  Color get backgroundPrimary => Colors.white;

  @override
  Color get titleAppBar => Colors.white;

  @override
  Color get titleMercadoria => Colors.black;

  @override
  Color get titleEstoque => Colors.black;

  @override
  Color get titlePontos => const Color(0xffcf1f36);

  @override
  Color get logadoComSucesso => const Color(0xff009342);

  Map<int, Color> color = {
    50: const Color.fromRGBO(36, 110, 233, .1),
    100: const Color.fromRGBO(36, 110, 233, .2),
    200: const Color.fromRGBO(36, 110, 233, .3),
    300: const Color.fromRGBO(36, 110, 233, .4),
    400: const Color.fromRGBO(36, 110, 233, .5),
    500: const Color.fromRGBO(36, 110, 233, .6),
    600: const Color.fromRGBO(36, 110, 233, .7),
    700: const Color.fromRGBO(36, 110, 233, .8),
    800: const Color.fromRGBO(36, 110, 233, .9),
    900: const Color.fromRGBO(36, 110, 233, 1),
  };

  @override
  String get hex => '0xff';

  //009342 - PAPAGAIO - cf1f36 BIO //004357 Cor legal
  //246EE9 Royal Blue //FF2400 Scarlet Red //3EB489 Mint Green
  @override
  String get colorFinal => 'c57a81';

  @override
  int get hexFinal => int.parse('$hex$colorFinal');

  @override
  MaterialColor get primary => MaterialColor(hexFinal, color);

  @override
  Color get backgroundButton => const Color(0xFFFCF3F4);
}
