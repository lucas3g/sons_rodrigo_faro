// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AudioStore on _AudioStoreBase, Store {
  late final _$_stateAtom =
      Atom(name: '_AudioStoreBase._state', context: context);

  @override
  AudioStates get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(AudioStates value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$audioPlayAtom =
      Atom(name: '_AudioStoreBase.audioPlay', context: context);

  @override
  String get audioPlay {
    _$audioPlayAtom.reportRead();
    return super.audioPlay;
  }

  @override
  set audioPlay(String value) {
    _$audioPlayAtom.reportWrite(value, super.audioPlay, () {
      super.audioPlay = value;
    });
  }

  late final _$set2xAtom =
      Atom(name: '_AudioStoreBase.set2x', context: context);

  @override
  bool get set2x {
    _$set2xAtom.reportRead();
    return super.set2x;
  }

  @override
  set set2x(bool value) {
    _$set2xAtom.reportWrite(value, super.set2x, () {
      super.set2x = value;
    });
  }

  late final _$contadorAtom =
      Atom(name: '_AudioStoreBase.contador', context: context);

  @override
  int get contador {
    _$contadorAtom.reportRead();
    return super.contador;
  }

  @override
  set contador(int value) {
    _$contadorAtom.reportWrite(value, super.contador, () {
      super.contador = value;
    });
  }

  late final _$playAudioAsyncAction =
      AsyncAction('_AudioStoreBase.playAudio', context: context);

  @override
  Future<void> playAudio(Audio audio) {
    return _$playAudioAsyncAction.run(() => super.playAudio(audio));
  }

  late final _$stopAudioAsyncAction =
      AsyncAction('_AudioStoreBase.stopAudio', context: context);

  @override
  Future<dynamic> stopAudio() {
    return _$stopAudioAsyncAction.run(() => super.stopAudio());
  }

  late final _$pauseResumeAudioAsyncAction =
      AsyncAction('_AudioStoreBase.pauseResumeAudio', context: context);

  @override
  Future<dynamic> pauseResumeAudio() {
    return _$pauseResumeAudioAsyncAction.run(() => super.pauseResumeAudio());
  }

  late final _$shareAudioAsyncAction =
      AsyncAction('_AudioStoreBase.shareAudio', context: context);

  @override
  Future<dynamic> shareAudio(Audio audio) {
    return _$shareAudioAsyncAction.run(() => super.shareAudio(audio));
  }

  late final _$favoritarAsyncAction =
      AsyncAction('_AudioStoreBase.favoritar', context: context);

  @override
  Future<void> favoritar(Audio audio) {
    return _$favoritarAsyncAction.run(() => super.favoritar(audio));
  }

  late final _$_AudioStoreBaseActionController =
      ActionController(name: '_AudioStoreBase', context: context);

  @override
  void setSpeedAudio() {
    final _$actionInfo = _$_AudioStoreBaseActionController.startAction(
        name: '_AudioStoreBase.setSpeedAudio');
    try {
      return super.setSpeedAudio();
    } finally {
      _$_AudioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audioPlay: ${audioPlay},
set2x: ${set2x},
contador: ${contador}
    ''';
  }
}
