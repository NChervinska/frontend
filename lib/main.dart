import 'package:flutter/material.dart';
import 'package:frontend/di/di.dart';

import 'animal_hostel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const AnimalHostelApp());
}
