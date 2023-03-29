import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/sampleData.dart';
import 'package:provider/provider.dart';

import '../env.dart';

class provider with ChangeNotifier {
  var firebs = FirebaseDatabase.instance.ref().child(rootNode).get();
  Map<dynamic, dynamic> rooms = data!;
  int get count => rooms.length;
  get lists => rooms;
  get name => rooms["livingroom"]['name'];
  String get type => rooms['type'];
  String get value => rooms['value'];
}
