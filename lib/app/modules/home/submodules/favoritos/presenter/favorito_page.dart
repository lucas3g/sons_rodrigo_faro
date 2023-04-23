import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sons_rodrigo_faro/app/core_module/components/widgets/button_audio_widget.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/favoritos/presenter/mobx/favorito_mobx.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:sons_rodrigo_faro/app/theme/app_theme.dart';

class FavoritoPage extends StatefulWidget {
  final FavoritoStore favoritoStore;

  const FavoritoPage({
    Key? key,
    required this.favoritoStore,
  }) : super(key: key);

  @override
  State<FavoritoPage> createState() => _FavoritoPageState();
}

class _FavoritoPageState extends State<FavoritoPage> {
  final audioStore = Modular.get<AudioStore>();

  Future loadFav() async {
    await widget.favoritoStore.getFavoritos();
  }

  @override
  void initState() {
    super.initState();

    loadFav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Observer(
          builder: (_) {
            final audios = widget.favoritoStore.audiosFav;

            if (audios.isEmpty) {
              return Center(
                child: Text(
                  'Nenhum audio salvo como favorito :(',
                  style: AppTheme.textStyles.titleAppBar,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.only(bottom: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.56,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: audios.length,
              itemBuilder: (context, index) {
                final audio = audios[index];
                return ButtonAudioWidget(
                  audio: audio,
                  audioStore: audioStore,
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
