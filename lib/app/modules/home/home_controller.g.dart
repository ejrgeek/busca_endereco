// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaEnderecosAtom = Atom(name: '_HomeControllerBase.listaEnderecos');

  @override
  List<EnderecoModel> get listaEnderecos {
    _$listaEnderecosAtom.reportRead();
    return super.listaEnderecos;
  }

  @override
  set listaEnderecos(List<EnderecoModel> value) {
    _$listaEnderecosAtom.reportWrite(value, super.listaEnderecos, () {
      super.listaEnderecos = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_HomeControllerBase.search');

  @override
  Future<bool> search(
      {@required dynamic estado,
      @required dynamic cidade,
      @required dynamic logradouro}) {
    return _$searchAsyncAction.run(() =>
        super.search(estado: estado, cidade: cidade, logradouro: logradouro));
  }

  @override
  String toString() {
    return '''
listaEnderecos: ${listaEnderecos}
    ''';
  }
}
