import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/core_module/core_module.dart';
import 'package:sons_rodrigo_faro/app/modules/home/home_module.dart';
import 'package:sons_rodrigo_faro/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    SplashModule(),
    HomeModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
