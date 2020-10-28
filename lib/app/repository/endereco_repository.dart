import 'dart:convert';

import 'package:busca_endereco/app/models/endereco_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnderecoRepository {
  static String _enderecoLista = 'key_list';

  Future<SharedPreferences> instance() async {
    return await SharedPreferences.getInstance();
  }

  salvaEnderecos(List<EnderecoModel> enderecos) async {
    try {
      SharedPreferences instancia = await instance();
      List<String> lista = List<String>();

      enderecos.forEach((endereco) => lista.add(json.encode(endereco)));

      instancia.setStringList(_enderecoLista, lista);
    } catch (e) {
      print('\n\nERRO SALVAR: $e\n\n');
    }
  }

  Future<List<EnderecoModel>> lerEnderecos() async {
    SharedPreferences instancia = await instance();
    List<String> stringEnderecos = instancia.getStringList(_enderecoLista);

    List<EnderecoModel> enderecos = List<EnderecoModel>();

    stringEnderecos.forEach((endereco) =>
        enderecos.add(EnderecoModel.fromJson(jsonDecode(endereco))));

    return enderecos;
  }
}
