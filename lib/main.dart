import 'package:advanced_flutter/app/app.dart';
import 'package:advanced_flutter/app/denpendeny_injection.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp());
}



