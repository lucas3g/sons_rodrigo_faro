import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/favoritos/presenter/favorito_page.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/favoritos/presenter/mobx/favorito_mobx.dart';

class FavoritoModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => FavoritoPage(
            favoritoStore: Modular.get<FavoritoStore>(),
          )),
    ),
  ];
}
