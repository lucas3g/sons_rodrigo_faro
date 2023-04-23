import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/modules/home/presenter/home_page.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/favoritos/favorito_module.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/favoritos/presenter/mobx/favorito_mobx.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/lista_audios_module.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/presenter/mobx/get_audios_store.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/meus_audios/meus_audios_module.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';

ModuleRoute configuraModule(
  String name, {
  required Module module,
  TransitionType? transition,
  CustomTransition? customTransition,
  Duration? duration,
  List<RouteGuard> guards = const [],
}) {
  return ModuleRoute(
    name,
    transition: TransitionType.noTransition,
    module: module,
  );
}

Widget animationPage(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  late double begin = 0;

  const end = 1.0;
  const curve = Curves.fastOutSlowIn;

  final tween = Tween(begin: begin, end: end);

  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );

  return FadeTransition(
    opacity: tween.animate(curvedAnimation),
    child: child,
  );
}

class HomeModule extends Module {
  @override
  final List<Module> imports = [
    ListaAudioModule(),
    MeusAudiosModule(),
    FavoritoModule(),
  ];

  @override
  final List<Bind<Object>> binds = [
    //Player
    Bind.singleton(
      (i) => AudioPlayer(),
    ),

    //Mobx
    Bind.singleton<AudioStore>(
      (i) => AudioStore(audioPlayer: i(), db: i()),
    ),

    Bind.singleton<FavoritoStore>(
      (i) => FavoritoStore(db: i()),
    ),

    Bind.singleton<GetAudiosStore>(
      (i) => GetAudiosStore(db: i()),
    ),

    Bind.singleton<MeusAudiosStore>(
      (i) => MeusAudiosStore(db: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => const HomePage()),
      children: [
        configuraModule('/lista', module: ListaAudioModule()),
        configuraModule('/meus_audios', module: MeusAudiosModule()),
        configuraModule('/favorito', module: FavoritoModule()),
      ],
    ),
  ];
}
