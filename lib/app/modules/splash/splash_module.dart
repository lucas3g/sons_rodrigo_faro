import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/modules/splash/presenter/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind<Object>> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => const SplashPage()),
    ),
  ];
}
