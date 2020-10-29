import 'dart:convert';

import 'package:busca_endereco/app/models/endereco_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnderecoRepository {
  static String _enderecoLista = 'key_list';
  static String _enderecoLog = 'key_log';
  static String _enderecoCidade = 'key_cidade';
  static String _enderecoUf = 'key_uf';

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

  salvaLog(String logradouro) async {
    try {
      SharedPreferences instancia = await instance();

      instancia.setString(_enderecoLog, logradouro);
    } catch (e) {
      print('\n\nERRO SALVAR: $e\n\n');
    }
  }

  salvaCidade(String cidade) async {
    try {
      SharedPreferences instancia = await instance();

      instancia.setString(_enderecoCidade, cidade);
    } catch (e) {
      print('\n\nERRO SALVAR: $e\n\n');
    }
  }

  salvaEstado(String estado) async {
    try {
      SharedPreferences instancia = await instance();

      instancia.setString(_enderecoUf, estado);
    } catch (e) {
      print('\n\nERRO SALVAR: $e\n\n');
    }
  }

  Future<String> getLog() async {
    SharedPreferences instancia = await instance();
    
    return instancia.getString(_enderecoLog);
  }

  Future<String> getCidade() async {
    SharedPreferences instancia = await instance();
    
    return instancia.getString(_enderecoCidade);
  }

  Future<String> getEstado() async {
    SharedPreferences instancia = await instance();
    
    return instancia.getString(_enderecoUf);
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
