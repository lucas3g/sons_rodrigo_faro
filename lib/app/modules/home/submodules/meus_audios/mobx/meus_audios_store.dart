// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:mobx/mobx.dart';
import 'package:sons_rodrigo_faro/app/core_module/constants/constants.dart';
import 'package:sons_rodrigo_faro/app/core_module/services/sqflite/adapters/filter_entity.dart';
import 'package:sons_rodrigo_faro/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:sons_rodrigo_faro/app/core_module/services/sqflite/adapters/tables.dart';
import 'package:sons_rodrigo_faro/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:sons_rodrigo_faro/app/modules/home/submodules/meus_audios/mobx/states/meus_audios_states.dart';
import 'package:sons_rodrigo_faro/app/utils/formatters.dart';
import 'package:sons_rodrigo_faro/app/utils/my_snackbar.dart';
import 'package:uuid/uuid.dart';

part 'meus_audios_store.g.dart';

class MeusAudiosStore = _MeusAudiosStoreBase with _$MeusAudiosStore;

abstract class _MeusAudiosStoreBase with Store {
  final ISQLFliteStorage db;

  _MeusAudiosStoreBase({
    required this.db,
  });

  @observable
  late String titulo = '';

  @observable
  late String fileNameAudio = '';

  @observable
  late bool clicouDeletar = false;

  @observable
  late bool pesquisar = false;

  @observable
  late File file = File('');

  @observable
  ObservableList<Audio> listAudios = ObservableList.of([]);

  @observable
  MeusAudiosStates _state = InitialMeusAudiosStates();

  MeusAudiosStates get state => _state;

  emit(MeusAudiosStates state) {
    _state = state;
  }

  @action
  Future procurarAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'aac',
        'midi',
        'mp3',
        'mpeg',
        'ogg',
        'wav',
      ],
    );

    if (result != null) {
      file = File(result.files.single.path!);
    }
  }

  @action
  Future<bool> saveAudio(String title) async {
    try {
      if (file.path.isNotEmpty) {
        final audio = await file.readAsBytes();

        final name = const Uuid().v1().substring(1, 10);

        final result = await FileSaver.instance.saveFile(name, audio, 'mp3');

        if (!result.contains('Something went wrong')) {
          final params = SQLFliteInsertParam(
            table: Tables.meus_audios,
            data: {
              'title': title,
              'path_file': result,
              'button_color': randomColor().toHex(),
              'assets': 0,
              'favorito': 0,
            },
          );

          await db.create(params);
          MySnackBar(message: 'Audio salvo com sucesso!');
          file = File('');
          return true;
        } else {
          MySnackBar(message: 'Erro ao tentar salvar audio!');
          file = File('');
          return false;
        }
      }
      MySnackBar(message: 'Selecione um audio.');
      return false;
    } catch (e) {
      MySnackBar(message: e.toString());
      file = File('');
      return false;
    }
  }

  @action
  Future getAllAudiosDB() async {
    try {
      emit(LoadingMeusAudiosStates());

      const filters =
          FilterEntity(name: 'assets', value: 0, type: FilterType.equal);

      final params = SQLFliteGetPerFilterParam(
          table: Tables.meus_audios, filters: {filters});

      final result = await db.getPerFilter(params);

      final List<Audio> list = List.from(result.map(Audio.toEntity).toList());

      list.sort((a, b) => b.id.compareTo(a.id));

      listAudios = ObservableList.of(list);

      emit(SuccessMeusAudiosStates());
    } catch (e) {
      emit(ErrorMeusAudiosStates(message: e.toString()));
    }
  }

  @observable
  int idAudio = 0;

  @action
  Future deleteAudio(Audio audio) async {
    try {
      if (!clicouDeletar) {
        idAudio = audio.id;
        clicouDeletar = true;

        Timer(const Duration(seconds: 2), () {
          clicouDeletar = false;
          idAudio = 0;
        });

        return;
      }

      clicouDeletar = false;

      if (!clicouDeletar && idAudio == audio.id) {
        final param =
            SQLFliteDeleteParam(table: Tables.meus_audios, id: audio.id);

        await db.delete(param);

        await File(audio.filePath).delete();

        idAudio = 0;

        getAllAudiosDB();
      }
    } catch (e) {
      idAudio = 0;
      MySnackBar(message: e.toString());
    }
  }

  @action
  void clicouPesquisar() {
    pesquisar = !pesquisar;
  }

  @observable
  String filtro = '';

  @computed
  ObservableList<Audio> get filtredList {
    if (filtro.isEmpty) {
      return listAudios;
    }

    return ObservableList.of(listAudios
        .where(
          (audio) => (audio.name.toLowerCase().removeAcentos().contains(
                filtro.toLowerCase().removeAcentos(),
              )),
        )
        .toList());
  }

  @action
  Future getDadosAudio(int idAudio) async {
    final filters =
        FilterEntity(name: 'id', value: idAudio, type: FilterType.equal);

    final params = SQLFliteGetPerFilterParam(
        table: Tables.meus_audios, filters: {filters});

    final result = await db.getPerFilter(params);

    if (result.isNotEmpty) {
      titulo = result[0]['title'];
      fileNameAudio = result[0]['path_file'];
    }
  }

  @action
  Future changeTitle(int idAudio, String title) async {
    final params = SQLFliteUpdateParam(
      table: Tables.meus_audios,
      id: idAudio,
      field: 'title',
      value: title,
    );

    await db.update(params);
  }
}
