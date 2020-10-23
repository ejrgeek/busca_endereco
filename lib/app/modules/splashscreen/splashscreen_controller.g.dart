// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splashscreen_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SplashscreenController = BindInject(
  (i) => SplashscreenController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashscreenController on _SplashscreenControllerBase, Store {
  final _$valueAtom = Atom(name: '_SplashscreenControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_SplashscreenControllerBaseActionController =
      ActionController(name: '_SplashscreenControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SplashscreenControllerBaseActionController
        .startAction(name: '_SplashscreenControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SplashscreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
