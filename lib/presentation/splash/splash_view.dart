import 'dart:async';

import 'package:advanced_flutter/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(seconds: 3), _goNext());
  }
  _goNext(){
    Navigator.pushReplacementNamed(context,Routes.loginRoute);
  }
  @override
  void initState() {
_startDelay();
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
