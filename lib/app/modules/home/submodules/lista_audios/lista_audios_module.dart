import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/favoritos/favorito_module.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/presenter/lista_audios_page.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/presenter/mobx/get_audios_store.dart';

class ListaAudioModule extends Module {
  @override
  final List<Module> imports = [
    FavoritoModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => ListaAudiosPage(
            audioStore: Modular.get<AudioStore>(),
            getAudiosStore: Modular.get<GetAudiosStore>(),
          )),
    ),
  ];
}
