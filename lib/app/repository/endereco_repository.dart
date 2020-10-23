import 'dart:convert';

import 'package:busca_endereco/app/models/endereco_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnderecoRepository {
  static String enderecoLista = 'key_list';

  Future<SharedPreferences> instance() async {
    return await SharedPreferences.getInstance();
  }

  salvaEnderecos(List<EnderecoModel> enderecos) async {
    SharedPreferences instancia = await instance();
    List lista = List();

    enderecos.forEach((endereco) => lista.add(json.encode(endereco)));

    instancia.setStringList(enderecoLista, lista);
  }

  Future<List<EnderecoModel>> lerEnderecos() async {
    SharedPreferences instancia = await instance();
    List<String> stringEnderecos = instancia.getStringList(enderecoLista);

    List<EnderecoModel> enderecos = List<EnderecoModel>();

    stringEnderecos.forEach(
      (endereco) => enderecos.add(
        EnderecoModel.fromJson(jsonDecode(endereco))
      )
    );

    return enderecos;
  }
}
