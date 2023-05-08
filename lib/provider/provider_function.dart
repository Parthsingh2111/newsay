import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Movementfun extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  final titlebox = Hive.box('titlebox');
  final sourcebox = Hive.box('source');
  final descbox = Hive.box('desc');
}
