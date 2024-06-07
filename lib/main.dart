import 'package:flutter/material.dart';
import 'package:tr_treeview/assets/assets.dart';
import 'package:tr_treeview/assets/core/dependences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dependencies.init();
  runApp(const Assets());
}
