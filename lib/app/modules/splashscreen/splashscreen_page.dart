import 'package:busca_endereco/app/app_controller.dart';
import 'package:busca_endereco/app/utils/imgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splashscreen_controller.dart';

class SplashscreenPage extends StatefulWidget {
  final String title;
  const SplashscreenPage({Key key, this.title = "Splashscreen"})
      : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState
    extends ModularState<SplashscreenPage, SplashscreenController> {
  //use 'controller' variable to access controller
  final appController = Modular.get<AppController>();

  toHome() async {
    String page = '/home';
    return await Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false),
    );
  }

  @override
  void initState() {
    super.initState();
    toHome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.biggest.width;
          double h = constraints.biggest.height;

          return Container(
            width: w * 1,
            height: h * 1,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //
                Container(
                  height: .35 * h,
                ),
                //
                Container(
                  height: .25 * h,
                  child: Image.asset(Imagens.logo_splash),
                ),
                //
                Container(
                  height: .3 * h,
                ),
                //
                Container(
                  alignment: Alignment.bottomCenter,
                  height: .05 * h,
                ),
                //
              ],
            ),
          );
        },
      ),
    );
  }
}
