import 'package:flutter/material.dart';
import 'package:hotel_task/app/app.dart';
import 'package:hotel_task/app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(MyApp());
}
