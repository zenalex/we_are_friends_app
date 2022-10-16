import 'package:flutter/material.dart';
import 'package:nsg_controls/nsg_controls.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var controller = Get.find<MainStatusController>();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BodyWrap(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[Text('Start page')],
          ),
        ),
      ),
    );
  }
}
