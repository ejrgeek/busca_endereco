import 'endereco_list_view_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'endereco_list_view_page.dart';

class EnderecoListViewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $EnderecoListViewController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EnderecoListViewPage()),
      ];

  static Inject get to => Inject<EnderecoListViewModule>.of();
}
