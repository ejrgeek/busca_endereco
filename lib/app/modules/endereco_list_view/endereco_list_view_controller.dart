import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'endereco_list_view_controller.g.dart';

@Injectable()
class EnderecoListViewController = _EnderecoListViewControllerBase
    with _$EnderecoListViewController;

abstract class _EnderecoListViewControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
