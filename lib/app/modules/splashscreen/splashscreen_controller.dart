import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splashscreen_controller.g.dart';

@Injectable()
class SplashscreenController = _SplashscreenControllerBase
    with _$SplashscreenController;

abstract class _SplashscreenControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
