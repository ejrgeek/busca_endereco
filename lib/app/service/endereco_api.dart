import 'dart:convert';

import 'package:busca_endereco/app/models/endereco_model.dart';
import 'package:busca_endereco/app/repository/endereco_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EnderecoApi {
  String _baseUrl = 'https://viacep.com.br/ws';

  Future<List<EnderecoModel>> getEnderecos({
    @required uf,
    @required cidade,
    @required logradouro,
  }) async {
    try {
      String urlService = '$_baseUrl/$uf/$cidade/$logradouro';
      final http.Response response = await http.get(urlService);

      if (response.statusCode == 200) {
        List<EnderecoModel> enderecos = List<EnderecoModel>();
        var jsonResponse = json.decode(response.body);

        jsonResponse.forEach(
          (endereco) => enderecos.add(
            EnderecoModel.fromJson(endereco),
          ),
        );

        await EnderecoRepository().salvaEnderecos(enderecos);

        return enderecos;
      } else {
        return List<EnderecoModel>.empty();
      }
    } catch (e) {
      return List<EnderecoModel>.empty();
    }
  }
}
