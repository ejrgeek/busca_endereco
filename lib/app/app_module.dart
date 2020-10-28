import 'package:busca_endereco/app/modules/endereco_list_view/endereco_list_view_module.dart';
import 'package:busca_endereco/app/modules/splashscreen/splashscreen_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:busca_endereco/app/app_widget.dart';
import 'package:busca_endereco/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashscreenModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/lista_enderecos', module: EnderecoListViewModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
