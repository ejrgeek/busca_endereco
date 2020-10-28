import 'package:busca_endereco/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'endereco_list_view_controller.dart';

class EnderecoListViewPage extends StatefulWidget {
  final String title;
  const EnderecoListViewPage({Key key, this.title = "EnderecoListView"})
      : super(key: key);

  @override
  _EnderecoListViewPageState createState() => _EnderecoListViewPageState();
}

class _EnderecoListViewPageState
    extends ModularState<EnderecoListViewPage, EnderecoListViewController> {
  //use 'controller' variable to access controller
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${homeController.listaEnderecos[0].localidade}, ${homeController.listaEnderecos[0].uf}',
        ),
        backgroundColor: Color(0xFF4C9B1C),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          //
          ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Color(0xFF4C9B1C),
            ),
            itemCount: homeController.listaEnderecos.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'CEP: ${homeController.listaEnderecos[index].cep}',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                'Logradouro: ${homeController.listaEnderecos[index].logradouro}',
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
