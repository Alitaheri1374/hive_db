import 'package:flutter/material.dart';
import 'package:test_hive/util/services.dart';
import 'package:test_hive/my_app.dart';
void main() async{
  await PersonServices.init();
  runApp(const MyApp());
}


