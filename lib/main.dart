import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketfirst/Auth/loginScreen.dart';
import 'package:ticketfirst/Auth/splashScreen.dart';
import 'package:ticketfirst/Provider/splashProvider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSplashVisible = ref.watch(splashProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isSplashVisible ? const SplashScreen() : LoginScreen(),
    );
  }
}
