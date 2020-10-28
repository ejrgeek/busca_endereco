// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_list_view_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EnderecoListViewController = BindInject(
  (i) => EnderecoListViewController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoListViewController on _EnderecoListViewControllerBase, Store {
  final _$valueAtom = Atom(name: '_EnderecoListViewControllerBase.value');

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

  final _$_EnderecoListViewControllerBaseActionController =
      ActionController(name: '_EnderecoListViewControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_EnderecoListViewControllerBaseActionController
        .startAction(name: '_EnderecoListViewControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EnderecoListViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
