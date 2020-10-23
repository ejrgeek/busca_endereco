import 'package:busca_endereco/app/models/endereco_model.dart';
import 'package:busca_endereco/app/service/endereco_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final listaEstados = List<String>.of(
    ['Paraíba', 'Ceará', 'Rio Grande do Norte'],
  );

  @observable
  List<EnderecoModel> listaEnderecos = List<EnderecoModel>();

  String getUF(String estado) {
    String uf = '';
    switch (estado) {
      case 'Paraíba':
        uf = 'pb';
        break;
      case 'Ceará':
        uf = 'ce';
        break;
      case 'Rio Grande do Norte':
        uf = 'rn';
        break;
      default:
        break;
    }
    return uf;
  }

  @action
  Future<List<EnderecoModel>> search({@required estado, @required cidade, @required logradouro}) async {
    String uf = getUF(estado);

    try {
      listaEnderecos = await EnderecoApi().getEnderecos(
        uf: uf,
        cidade: cidade,
        logradouro: logradouro,
      );
      return listaEnderecos;
    } catch (e) {
      return List<EnderecoModel>.empty();
    }
  }
}
