import 'package:flutter_riverpod/flutter_riverpod.dart';

final editProvider = StateProvider<int>((ref) => 0);
final fetchDataProvider = StateProvider<int>((ref) => 0);

final xProvider = StateProvider<String>((ref) => "");
final yProvider = StateProvider<int>((ref) => 0);
