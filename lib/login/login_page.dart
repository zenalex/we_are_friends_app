import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsg_controls/nsg_button.dart';
import 'package:nsg_data/nsg_data.dart';

import 'login_params.dart';

class LoginPage extends NsgPhoneLoginPage {
  LoginPage(NsgDataProvider provider, {super.key})
      : super(provider, widgetParams: LoginPage.getWidgetParams());

  @override
  Widget getLogo(BuildContext context) {
    const List<String> images = <String>[
      'lib/assets/images/sv1.svg',
      'lib/assets/images/sv2.svg',
      'lib/assets/images/sv3.svg',
      'lib/assets/images/sv4.svg',
      'lib/assets/images/logo.svg'
    ];
    var logo = Center(
        child: Transform.translate(
            offset: const Offset(0, -50),
            child: Transform.scale(
              scale: 2,
              child: Stack(
                children: [
                  SvgPicture.asset(images[0]),
                  Transform.translate(
                      offset: const Offset(13.5, 26),
                      child: SvgPicture.asset(images[1])),
                  Transform.translate(
                      offset: const Offset(10, 10),
                      child: SvgPicture.asset(images[2])),
                  Transform.translate(
                      offset: const Offset(37, 0),
                      child: SvgPicture.asset(images[3])),
                  Transform.translate(
                      offset: const Offset(0, 80),
                      child: SvgPicture.asset(images[4]))
                ],
              ),
            )));

    return logo;
  }

  @override
  Image getBackground(BuildContext context) {
    var background = const Image(
      image: AssetImage('lib/assets/titan-back.png'),
    );
    return background;
  }

  @override
  Widget getButtons(BuildContext context) {
    return NsgButton(
      onPressed: () {
        sendData(context);
      },
      text: 'Получить СМС'.toUpperCase(),
    );
  }

  @override
  AppBar getAppBar(BuildContext context) {
    return AppBar(title: Text('Регистрация'.toUpperCase()), centerTitle: true);
  }

  static NsgPhoneLoginParams getWidgetParams() {
    return LoginParams();
  }
}
