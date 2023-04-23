import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/theme/app_theme.dart';
import 'package:sons_rodrigo_faro/app/utils/navigation_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.navigatorKey);
    Modular.setObservers([
      BotToastNavigatorObserver(),
    ]);

    return MaterialApp.router(
      title: 'Vai dar namoro - Rodrigo Faro',
      builder: (context, widget) {
        widget = BotToastInit()(context, widget);
        return widget;
      },
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppTheme.colors.primary,
        scaffoldBackgroundColor: AppTheme.colors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.colors.primary,
          titleTextStyle: AppTheme.textStyles.titleAppBar,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
