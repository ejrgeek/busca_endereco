import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  GlobalKey<FormState> _formKey = new GlobalKey();

  TextEditingController _cidade = TextEditingController();
  TextEditingController _log = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _iconSearch = Icon(Icons.search, color: Colors.blue);
  bool _iconButton = false;
  Widget _loader = CircularProgressIndicator();

  String _estado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Busca Endereço'),
        backgroundColor: Color(0xFF4C9B1C),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  'Selecione um estado',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                items: controller.listaEstados.map(
                  (estado) {
                    return DropdownMenuItem<String>(
                      value: estado,
                      child: Text(estado),
                    );
                  },
                ).toList(),
                value: _estado,
                onChanged: (value) {
                  setState(() {
                    _estado = value;
                  });
                },
              ),
            ),
            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Digite uma cidade'),
                keyboardType: TextInputType.text,
                controller: _cidade,
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Campo não pode ser vazio';
                  } else if (value.length < 3) {
                    return 'Precisa ter 3 ou mais digitos';
                  }
                  return null;
                },
              ),
            ),
            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Digite um logradouro'),
                keyboardType: TextInputType.text,
                controller: _log,
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Campo não pode ser vazio';
                  } else if (value.length < 3) {
                    return 'Precisa ter 3 ou mais digitos';
                  }
                  return null;
                },
              ),
            ),
            //
            Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton.icon(
                icon: _iconButton ? _loader : _iconSearch,
                label: Text(
                  'Buscar',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate() && _estado != null) {
                    setState(() {
                      _iconButton = true;
                    });

                    bool status = await controller.search(
                      estado: _estado,
                      cidade: _cidade.text,
                      logradouro: _log.text,
                    );

                    setState(() {
                      _iconButton = false;
                    });

                    if (!status) {
                      final snackBar = SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //
                            Icon(Icons.sentiment_very_dissatisfied),
                            //
                            Text(
                              'Sem endereço',
                              textAlign: TextAlign.center,
                            )
                            //
                          ],
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      );
                      _scaffoldKey.currentState.showSnackBar(snackBar);
                    } else {
                      Modular.to.pushNamed('/lista_enderecos');
                    }
                  } else if (_estado == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Falta selecionar um estado'),
                          content: Text(
                              'Você precisa selecionar um estado para continuar'),
                          actions: [
                            FlatButton(
                              child: new Text("Fechar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
