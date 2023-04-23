import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:sons_rodrigo_faro/app/app_module.dart';
import 'package:sons_rodrigo_faro/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting(await findSystemLocale(), '');

  // MobileAds.instance.initialize();

  // RequestConfiguration requestConfiguration =
  //     RequestConfiguration(testDeviceIds: ['5A8A6813409CA346303353BFA4188750']);

  // await MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
